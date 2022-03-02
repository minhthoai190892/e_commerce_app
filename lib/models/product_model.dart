import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});
  //FireStore
  static Product fromProductSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];
  static List<Product> products = [
    const Product(
      name: 'Soft Drinks #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1645268087365-953f5638f21e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      price: 1.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drinks #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1645466525466-647ef246067f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDN8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Soft Drinks #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1639046033583-390653f5c09a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDR8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drinks #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1544038626-8fcbf944c1c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM5fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drinks #4',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1645377370247-c4354ce4d328?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drinks #5',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1645148431551-7e279845447a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDl8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1608571702419-f1267e9a18fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8X2hiLWRsNFEtNFV8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Water #1',
      category: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1644472371341-6f47c441b932?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzfHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Water #2',
      category: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1642370582887-39ca266e91bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEyM3x4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      price: 233.99,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
