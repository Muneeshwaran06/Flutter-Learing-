import 'package:flutter/material.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addToWishlist(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromWishlist(Product product) {
    _items.remove(product);
    notifyListeners();
  }
}



