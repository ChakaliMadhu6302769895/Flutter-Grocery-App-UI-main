import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';

class CartProvider extends ChangeNotifier {
  List<GroceryItem> _cartItems = [];

  List<GroceryItem> get cartItems => _cartItems;

  void addToCart(GroceryItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(GroceryItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    for (var item in _cartItems) {
      totalAmount += item.price;
    }
    return totalAmount;
  }
}
