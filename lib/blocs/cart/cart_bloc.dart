import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemove) {
      yield* _mapCartProductRemoveToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
      // ignore: empty_catches
    } catch (e) {}
  }

  Stream<CartState> _mapCartProductAddedToState(
    CartProductAdded evnet,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(evnet.product)));
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  Stream<CartState> _mapCartProductRemoveToState(
    CartProductRemove evnet,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(evnet.product)));
        // ignore: empty_catches
      } catch (e) {}
    }
  }
}
