import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  //TẠO BIẾN KIỂU DANH SÁCH
  final List<Product> products;
  const ProductCarousel({
    Key? key, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true, //TẠO MẢNG CÓ THỂ CUỘN
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(product: products[index]),
          );
        },
      ),
    );
  }
}
