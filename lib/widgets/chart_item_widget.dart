import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import '../styles/colors.dart';
import 'item_counter_widget.dart';

class ChartItemWidget extends StatefulWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final void Function(int newQuantity) onQuantityChanged;

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
  final Color borderColor = Color(0xffE2E2E2);

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: 30,
      ),
      child:  IntrinsicHeight(
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
                    color: AppColors.darkGrey),
                SizedBox(
                  height: 12,
                ),
                Spacer(),
                ItemCounterWidget(
                  onAmountChanged: (newAmount) {
                    setState(() {
                      amount = newAmount;
                      widget.onQuantityChanged(newAmount);

                      // Update the displayed quantity
                      widget.item.displayedQuantity = newAmount;
                    });
                  },
                  initialAmount: widget.item.displayedQuantity, // Set initial amount
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Call the onRemove callback when the close icon is tapped
                    widget.onRemove();
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.darkGrey,
                    size: 25,
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                Container(
                  width: 100,
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