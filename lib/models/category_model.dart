import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];
  static List<Category> categories = [
    const Category(name: 'Soft Drink', imageUrl: 'https://picsum.photos/id/280/200/300'),
    const Category(name: 'Smoothies', imageUrl: 'https://picsum.photos/id/1080/200/300'),
    const Category(name: 'Water', imageUrl: 'https://picsum.photos/id/225/200/300'),
  ];
}
