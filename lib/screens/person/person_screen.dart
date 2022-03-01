import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);
  //KHAI BÁO BIẾN KIỂU STRING
  static const String routeName = '/person';
  //KHAI BÁO HÀM KIỂU ROUTE
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName) ,
      builder: (context) => const PersonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Person',
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName),
    );
  }
}
