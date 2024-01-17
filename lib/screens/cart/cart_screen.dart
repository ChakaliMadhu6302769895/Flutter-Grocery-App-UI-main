import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/widgets/chart_item_widget.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  final List<GroceryItem> cartItems;
  final int? selectedQuantity;
  final Function(int)? onQuantityChanged;
  final Function(List<GroceryItem>)? onItemsUpdated;
  final Function(GroceryItem)? onItemRemoved;

  CartScreen({
    required this.cartItems,
    this.selectedQuantity,
    required this.onItemRemoved,
    this.onQuantityChanged,
    this.onItemsUpdated,
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home screen
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = widget.cartItems[index];
                return Column(
                  children: [
                    ChartItemWidget(
                      item: cartItem,
                      onRemove: () {
                        setState(() {
                          widget.cartItems.remove(cartItem);
                        });
                        if (widget.onItemsUpdated != null) {
                          widget.onItemsUpdated!(widget.cartItems);
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
                    ),
                    Divider(), // Divider after each item
                  ],
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
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green[400] ,fixedSize: Size(400, 50)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return CheckoutBottomSheet();
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Go To Checkout" ,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white),
            ),
            Text("\Rs $totalPrice" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),),
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
