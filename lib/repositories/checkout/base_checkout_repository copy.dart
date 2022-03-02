// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import '../../models/models.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
