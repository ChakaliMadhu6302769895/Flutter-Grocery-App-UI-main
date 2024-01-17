import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'item_counter_widget.dart';

class ChartItemWidget extends StatefulWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final void Function(dynamic newQuantity) onQuantityChanged; // Add this line

  ChartItemWidget({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged, // Add this line
  }) : super(key: key);

  @override
  _ChartItemWidgetState createState() => _ChartItemWidgetState();
}

class _ChartItemWidgetState extends State<ChartItemWidget> {
  final double height = 110;
  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.item.name,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                  text: widget.item.description,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Replace with your actual color
                ),
                SizedBox(
                  height: 12,
                ),
                Spacer(),
                ItemCounterWidget(
                  onAmountChanged: (newAmount) {
                    setState(() {
                      widget.item.quantity = newAmount; // Update item quantity
                    });

                    widget.onQuantityChanged(newAmount); // Invoke the callback
                  },
                  initialAmount: widget.item.quantity, // Pass the initial quantity
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Call onRemove with the updated item quantity
                    widget.onRemove();
                  },
                ),
                Spacer(
                  flex: 5,
                ),
                Container(
                  width: 70,
                  child: AppText(
                    text: "\Rs ${getPrice().toStringAsFixed(2)}",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      width: 100,
      child: Image.asset(widget.item.imagePath),
    );
  }

  double getPrice() {
    return widget.item.price * widget.item.quantity;
  }
}
