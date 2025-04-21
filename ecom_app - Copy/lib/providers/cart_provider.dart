import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, String>> _items = [];

  List<Map<String, String>> get items => _items;

  void addItem(String name, String price) {
    _items.add({'name': name, 'price': price});
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int get itemCount => _items.length;
}