import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  //KHAI BÁO BIẾN KIỂU STRING
  static const String routeName = '/splash';
  //KHAI BÁO HÀM KIỂU ROUTE
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/'),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: ClipOval(
                child: Icon(
                  Icons.android_outlined,
                  size: 120,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Zero To Unicorn",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
