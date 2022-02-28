import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';

import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  //KHAI BÁO BIẾN KIỂU STRING
  static const String routeName = '/cart';
  //KHAI BÁO HÀM KIỂU ROUTE
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.cart.freeDeliveryString,
                              style: Theme.of(context).textTheme.headline5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const RoundedRectangleBorder(),
                                elevation: 0),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text(
                              "Add More Item",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // hiện sản phẩm

                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                              quantiy: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 2,
                      ),
                      //TOTAL
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SUBTOTAL:",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  "\$${state.cart.subtotalString}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "DELIVERY:",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  "\$${state.cart.deliveryFreeString}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SUBTOTAL:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "\$${state.cart.totalString}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {},
              child: Text(
                "GO TO CHECKOUT",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
