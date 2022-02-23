import 'package:carousel_slider/carousel_slider.dart';

import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enableInfiniteScroll:
                    false, // BĂNG CHUYỀN NÊN LẬP VÔ HẠN HAY KHÔNG
                enlargeStrategy:
                    CenterPageEnlargeStrategy.height, //PHÓNG TO TRANG TRUNG TÂM
                initialPage: 2,
                autoPlay: true,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCart(category: category))
                  .toList(),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "RECOMMENDED",
                style: Theme.of(context).textTheme.headline3,
              )),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
