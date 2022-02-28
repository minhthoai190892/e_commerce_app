// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:e_commerce_app/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
