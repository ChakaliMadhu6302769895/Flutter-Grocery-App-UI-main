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
        title: Text("My Cart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home screen
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
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
        },
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context, CartModel cart) {
    double totalPrice = cart.calculateTotalPrice();

    return Container(
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400], fixedSize: Size(400, 50)),
        onPressed: () {
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
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Go To Checkout",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              "\Rs $totalPrice",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
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