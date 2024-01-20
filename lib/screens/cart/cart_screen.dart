import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/widgets/chart_item_widget.dart';
import '../../models/cartmodel.dart';
import '../../models/grocery_item.dart';
import '../order_failed_dialog.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  final List<GroceryItem> cartItems;
  final Function(GroceryItem) onItemRemoved;
  final Function(List<GroceryItem>) onItemsUpdated;

  CartScreen({
    required this.cartItems,
    required this.onItemRemoved,
    required this.onItemsUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cart.cartItems[index];
                      return Column(
                        children: [
                          ChartItemWidget(
                            item: cartItem,
                            onRemove: () {
                              cart.removeFromCart(cartItem);
                            },
                            onQuantityChanged: (newQuantity) {
                              cart.updateCartItemQuantity(cartItem, newQuantity);
                            },
                          ),
                          Divider(), // Divider after each item
                        ],
                      );
                    },
                  ),
                ),
                getCheckoutButton(context, cart),
              ],
            );
          }
        },
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context, CartModel cart) {
    double totalPrice = cart.calculateTotalPrice();

    return Container(
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[400], fixedSize: Size(400, 50)),
        onPressed: () {
          if (cart.cartItems.isNotEmpty) {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return CheckoutBottomSheet(
                  onPlaceOrderClicked: (cart) {
                    onPlaceOrderClicked(context, cart);
                  },
                );
              },
            );
          } else {
            // Handle the case where the cart is empty
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Your cart is empty"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Go To Checkout",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              "\Rs $totalPrice",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void onPlaceOrderClicked(BuildContext context, CartModel cart) {
    cart.clearCart();
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OrderFailedDialogue();
      },
    );
  }
}
