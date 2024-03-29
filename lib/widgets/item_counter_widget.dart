import 'package:flutter/material.dart';
import 'package:grocery_app/styles/colors.dart';

class ItemCounterWidget extends StatefulWidget {
  final Function(int) onAmountChanged;
  final int initialAmount;

  ItemCounterWidget({
    required this.onAmountChanged,
    this.initialAmount = 1, // Provide a default value
  });

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  late int amount;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconWidget(Icons.remove, iconColor: AppColors.darkGrey, onPressed: decrementAmount),
        SizedBox(width: 18),
        Container(
          width: 30,
          child: Center(
            child: getText(text: amount.toString(), fontSize: 18, isBold: true),
          ),
        ),
        SizedBox(width: 18),
        iconWidget(Icons.add, iconColor: AppColors.primaryColor, onPressed: incrementAmount),
      ],
    );
  }

  void incrementAmount() {
    setState(() {
      amount = amount + 1;
      updateParent();
    });
  }

  void decrementAmount() {
    if (amount > 1) {
      setState(() {
        amount = amount - 1;
        updateParent();
      });
    }
  }

  void updateParent() {
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged(amount);
    }
  }

  Widget iconWidget(IconData iconData, {Color? iconColor, Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Color(0xffE2E2E2),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor ?? Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget getText({
    required String text,
    required double fontSize,
    bool isBold = false,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
