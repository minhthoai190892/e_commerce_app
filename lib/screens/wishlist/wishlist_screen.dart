import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);
  //KHAI BÁO BIẾN KIỂU STRING
  static const String routeName = '/pishlist';
  //KHAI BÁO HÀM KIỂU ROUTE
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Wishlist',
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                itemCount: state.wishlist.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishlist.products[index]  ,
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishlist: true,
                    ),
                  );
                });
          } else {
            return const Text("Something went wrong ");
          }
        },
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
    );
  }
}
