import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/config/app_route.dart';
import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishlistBloc()..add(StartWishlist()),
         ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zero To Unicorn',
        theme: theme(),
        //GỌI HÀM onGenerateRoute TỪ onGenerateRoute
        onGenerateRoute: AppRouter.onGenerateRoute,
        //TRẠNG THÁI BAN ĐẦU
        initialRoute: HomeScreen.routeName,
        // home: const HomeScreen(),
      ),
    );
  }
}
