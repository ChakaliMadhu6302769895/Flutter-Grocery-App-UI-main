import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';
import '../../widgets/chart_item_widget.dart'; // Import the correct widget
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  late final List<GroceryItem> cartItems;
  final int? selectedQuantity;
  final Function(int)? onQuantityChanged; // Make it nullable

  CartScreen({
    required this.cartItems,
    this.selectedQuantity,
    this.onQuantityChanged, // Make it nullable
  });

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
                final cartItem = widget.cartItems[index]; // Define cartItem here
                return ChartItemWidget(
                  item: cartItem,
                  onRemove: () {
                    setState(() {
                      widget.cartItems.remove(cartItem);
                    });
                  },
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItem.quantity = newQuantity;
                    });

                    if (widget.onQuantityChanged != null) {
                      widget.onQuantityChanged!(newQuantity);
                    }
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutBottomSheet()),
          );
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
