import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'item_counter_widget.dart';

class ChartItemWidget extends StatefulWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final void Function(dynamic newQuantity) onQuantityChanged;

  ChartItemWidget({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged,
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
            Container(
              padding: EdgeInsets.only(left:15),
              child: imageWidget(),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
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
                      // Update the quantity in the item
                      widget.item.quantity = newAmount;

                      // Notify the parent (CartScreen) about the quantity change
                      widget.onQuantityChanged(newAmount);
                    },
                    initialAmount: widget.item.quantity,
                  ),

                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.onRemove();
                  },
                ),
                Spacer(
                  flex: 5,
                ),
                Container(
                  width: 90,
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
