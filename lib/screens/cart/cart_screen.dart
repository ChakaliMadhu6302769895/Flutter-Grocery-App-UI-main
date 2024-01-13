import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';

import '../../widgets/chart_item_widget.dart';

class CartScreen extends StatefulWidget {
  final List<GroceryItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return ChartItemWidget(
                  item: widget.cartItems[index],
                  onRemove: () {
                    setState(() {
                      widget.cartItems.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          getCheckoutButton(context),
        ],
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    double totalPrice = calculateTotalPrice();

    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          // Implement checkout logic here
          // You may want to navigate to the checkout screen or perform other actions.
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Go To Checkout"),
            Text("\Rs $totalPrice"),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in widget.cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
}
