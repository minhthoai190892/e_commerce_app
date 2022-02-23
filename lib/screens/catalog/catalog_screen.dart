import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);
  //KHAI BÁO BIẾN KIỂU STRING
  static const String routeName = '/catalog';
  //KHAI BÁO HÀM KIỂU ROUTE
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts =
        Product.products.where((product) => product.category==category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      //HIỂN THỊ TẤT CẢ CÁC PRODUCT
      // body: ProductCard(product: Product.products[0]) , LẤY 1 PRODUCT
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          itemCount: categoryProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          }),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
