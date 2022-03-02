import 'package:e_commerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFree;
  final String? total;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    required this.subtotal,
    required this.deliveryFree,
    required this.total,
  });

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        products,
        subtotal,
        deliveryFree,
        total,
      ];
  Map<String, Object> toDocument() {
    // ignore: prefer_collection_literals
    Map customerAddrees = Map();
    customerAddrees['address'] = address;
    customerAddrees['city'] = city;
    customerAddrees['country'] = country;
    customerAddrees['zipCode'] = zipCode;
    return {
      'customerAddrees':customerAddrees,
      'customerName':fullName!,
      'customerEmail':email!,
      'products':products!.map((product) => product.name).toList(),
      'subtotal':subtotal!,
        'deliveryFree':deliveryFree!,
        'total':total!
    };
  }
}
