import 'package:uuid/uuid.dart';

class Product {
  final String id = const Uuid().v4();
  String title;
  String category;
  String image;
  double price;
  int popularity;
  int quantityLeft;

  Product({
    required this.title,
    required this.category,
    required this.image,
    required this.price,
    required this.popularity,
    required this.quantityLeft
  });
}