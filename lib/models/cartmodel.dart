import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';

class CartModel extends ChangeNotifier {
  List<GroceryItem> _cartItems = [];
  List<GroceryItem> _favoriteItems = [];
  List<GroceryItem> _allItems = [];

  List<GroceryItem> get cartItems => _cartItems;
  List<GroceryItem> get favoriteItems => _favoriteItems;

  void addToCart(GroceryItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(GroceryItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void addToFavorites(GroceryItem item) {
    _favoriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavorites(GroceryItem item) {
    _favoriteItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void loadFavoriteItems(List<String> favoriteItemIds) {
    _favoriteItems = _allItems.where((item) => favoriteItemIds.contains(item.id)).toList();
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
