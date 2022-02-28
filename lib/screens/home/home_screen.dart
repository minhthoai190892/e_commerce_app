

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/blocs/category/category_bloc.dart';


import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //KHAI BÁO BIẾN KIỂU STRING
  static const String routeName = '/';
  //KHAI BÁO HÀM KIỂU ROUTE
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero To Unicorn',
      ),
      body: ListView(
        children: [
          Column(
            children: [
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enableInfiniteScroll:
                            false, // BĂNG CHUYỀN NÊN LẬP VÔ HẠN HAY KHÔNG
                        enlargeStrategy: CenterPageEnlargeStrategy
                            .height, //PHÓNG TO TRANG TRUNG TÂM
                        initialPage: 2,
                        autoPlay: true,
                      ),
                      items: state.categories
                          .map((category) => HeroCarouselCart(
                                category: category,
                              ))
                          .toList(),
                    );
                  } else {
                    return const Text("Something went Wrong");
                  }
                },
              ),
              const SectionTitle(
                title: "RECOMMENDED",
              ),
              // //PRODUCT CARD
              // ProductCard(product: Product.products[0]),
              //PRODUCT_CARD
              //PRODUCT CAROUSEL RECOMMENDED
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList(),
                    );
                  } else {
                    return const Text("Something wen wrong");
                  }
                },
              ),
              //POPULAR
              const SectionTitle(
                title: "MOST POPULAR",
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList(),
                    );
                  } else {
                    return const Text("Something went wrong") ;
                  }
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
