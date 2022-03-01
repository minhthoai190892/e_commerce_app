import 'package:e_commerce_app/blocs/bloc/product_bloc.dart';
import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/blocs/category/category_bloc.dart';

import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/config/app_route.dart';
import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/repositories/category/category_repository.dart';
import 'package:e_commerce_app/repositories/product/product_repository.dart';
import 'package:e_commerce_app/screens/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        BlocProvider(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
         BlocProvider(
          create: (context) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories()),
        ),
        BlocProvider(
          create: (context) =>ProductBloc(productRepository: ProductRepository())..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zero To Unicorn',
        theme: theme(),
        //GỌI HÀM onGenerateRoute TỪ onGenerateRoute
        onGenerateRoute: AppRouter.onGenerateRoute,
        //TRẠNG THÁI BAN ĐẦU
        initialRoute: CheckoutScreen.routeName,
        // home: const HomeScreen(),
      ),
    );
  }
}
