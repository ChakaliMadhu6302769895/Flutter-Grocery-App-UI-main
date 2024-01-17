import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';
import '../../widgets/chart_item_widget.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {

  final List<GroceryItem> cartItems;
  final int? selectedQuantity;
  final Function(int)? onQuantityChanged;
  final Function(List<GroceryItem>)? onItemsUpdated;
  var onItemRemoved; // Updated to List<GroceryItem>

  CartScreen({
    required this.cartItems,
    this.selectedQuantity,
    required this.onItemRemoved,
    this.onQuantityChanged,
    this.onItemsUpdated,
    // Updated to List<GroceryItem>
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
                final cartItem = widget.cartItems[index];
                return ChartItemWidget(
                  item: cartItem,
                  onRemove: () {
                    setState(() {
                      widget.cartItems.remove(cartItem);
                    });
                    if (widget.onItemsUpdated  != null) {
                      widget.onItemsUpdated! (widget.cartItems);
                    }
                  },
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItem.quantity = newQuantity;
                    });
                    if (widget.onItemsUpdated != null) {
                      widget.onItemsUpdated!(widget.cartItems);
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
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return CheckoutBottomSheet(); // Replace this with your actual bottom sheet widget
            },
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
