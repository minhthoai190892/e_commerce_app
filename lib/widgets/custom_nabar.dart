

import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;
  const CustomNavBar({
    Key? key,
    this.product,
    required this.screen,
  }) : super(key: key);
  // ignore: body_might_complete_normally_nullable, non_constant_identifier_names
  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNabar(context);
      case '/catalog':
        return _buildNabar(context);
      case '/wishlist':
        return _buildNabar(context);
      case '/product':
        return _buildAddToCartNabar(context, product);
      case '/cart':
        return _buildGotoCheckoutNabar(context);
      case '/checkout':
        return _buildOrderNowNabar(context);
      default:
        _buildNabar(context);
    }
  }

  List<Widget> _buildNabar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        icon: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        icon: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    ];
  }

  List<Widget> _buildAddToCartNabar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.share),
        color: Colors.white,
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return IconButton(
              onPressed: () {
                // ignore: prefer_const_declarations
                final snackBar =
                    const SnackBar(content: Text("Added to your Wihslist"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<WishlistBloc>().add(AddWishlistProduct(product));
              },
              icon: const Icon(Icons.favorite),
              color: Colors.white,
            );
          }
          return const Text("Somethinh went Wrong");
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                Navigator.pushNamed(context, '/cart');
              },
              child: Text(
                "Add To Cart",
                style: Theme.of(context).textTheme.headline3,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: const RoundedRectangleBorder()),
            );
          }
          return const Text("Something went wrong");
        },
      )
    ];
  }

  List<Widget> _buildGotoCheckoutNabar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        child: Text(
          "Go To Checkout",
          style: Theme.of(context).textTheme.headline3,
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
      ),
    ];
  }

  List<Widget> _buildOrderNowNabar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));
              },
              child: Text(
                "Orther Now",
                style: Theme.of(context).textTheme.headline3,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const RoundedRectangleBorder(),
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen)!,
          // [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/');
          //     },
          //     icon: const Icon(
          //       Icons.home,
          //       color: Colors.white,
          //     ),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/cart');
          //     },
          //     icon: const Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/person');
          //     },
          //     icon: const Icon(
          //       Icons.person,
          //       color: Colors.white,
          //     ),
          //   ),
          // ],
        ),
      ),
    );
  }
}
