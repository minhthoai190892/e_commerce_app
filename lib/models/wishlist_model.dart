import 'package:e_commerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  //tạo danh sách product
  final List<Product> products;

  const Wishlist({this.products = const <Product>[]});
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props =>[products];
}
