import 'package:e_commerce_app/screens/screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  //TẠO HÀM KIỂU ROUTE
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print("This is route setting: ${settings.name}");
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/cart':
        return CartScreen.route();
      case '/catalog':
        return CatalogScreen.route();
      case '/person':
        return PersonScreen.route();
        case '/product':
        return ProductScreen.route();
        case '/wishlist':
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/'),
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
      ),
    );
  }
}
