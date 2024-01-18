import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';

class CartModel extends ChangeNotifier {
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

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

}