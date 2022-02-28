import 'package:e_commerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});
  //tính tổng giỏ hàng
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  //chuyển subtotal sang chuổi
  String get subtotalString => subtotal.toStringAsFixed(2);

  //tính delivery
  double deliveryFree(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

//chuyển subtotal sang chuổi
  String get deliveryFreeString => deliveryFree(subtotal).toStringAsFixed(2);

  //FreeDelivery
  // ignore: non_constant_identifier_names
  String FreeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return "You have Free Delivery";
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

//chuyển subtotal sang chuổi
  String get freeDeliveryString => FreeDelivery(subtotal);
// tính tổng
  double total(subtotal, deliveryFree) {
    return subtotal + deliveryFree(subtotal);
  }

//chuyển total sang chuổi
  String get totalString => total(subtotal, deliveryFree).toStringAsFixed(2);
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [products];

  //click product

  Map productQuantity(products) {
    var quantity = Map();
    products.forEach(
      (product) {
        if (!quantity.containsKey(product)) {
          quantity[product] = 1;
        } else {
          quantity[product] += 1;
        }
      },
    );
    return quantity;
  }
}
