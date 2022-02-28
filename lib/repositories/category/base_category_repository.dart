import 'package:e_commerce_app/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategores();
  
}
