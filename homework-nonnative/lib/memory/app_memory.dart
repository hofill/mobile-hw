import 'package:flutter/cupertino.dart';

import '../types/product.dart';

class AppMemory extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  set products(List<Product> products) {
    _products = products;
    notifyListeners();
  }
}
