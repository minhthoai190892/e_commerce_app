import 'package:e_commerce_app/config/app_route.dart';
import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero To Unicorn',
      theme: theme(),
      //GỌI HÀM onGenerateRoute TỪ onGenerateRoute
      onGenerateRoute: AppRouter.onGenerateRoute,
      //TRẠNG THÁI BAN ĐẦU
      initialRoute: HomeScreen.routeName,
      // home: const HomeScreen(),
    );
  }
}

