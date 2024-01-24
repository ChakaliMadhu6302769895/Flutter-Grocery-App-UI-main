import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:provider/provider.dart';
import '../../models/cartmodel.dart';
import '../order_accepted_screen.dart';
import '../order_failed_dialog.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final double totalPrice;
  final Function(BuildContext, CartModel) onPlaceOrderClickedCallback;

  CheckoutBottomSheet({
    required this.onPlaceOrderClickedCallback,
    required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final double totalPrice = Provider.of<CartModel>(context).calculateTotalPrice();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: new Wrap(
        children: <Widget>[
          Row(
            children: [
              AppText(
                text: "Checkout",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
          ),
          SizedBox(
            height: 35,
          ),
          checkoutRow("Total Cost", trailingText: "\Rs ${totalPrice.toStringAsFixed(2)}"),
          getDivider(),
          SizedBox(
            height: 15,
          ),
          termsAndConditionsAgreement(context),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: AppButton(
              label: "Place Order",
              fontWeight: FontWeight.w600,
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              onPressed: () {


                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderAcceptedScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'By placing an order you agree to our',
          style: TextStyle(
            color: Color(0xFF7C7C7C),
            fontSize: 14,
            fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: " Terms",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextSpan(text: " And"),
            TextSpan(
              text: " Conditions",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
    );
  }

  Widget checkoutRow(String label,
      {String? trailingText, Widget? trailingWidget}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          AppText(
            text: label,
            fontSize: 18,
            color: Color(0xFF7C7C7C),
            fontWeight: FontWeight.w600,
          ),
          Spacer(),
          trailingText == null
              ? (trailingWidget ?? Container())
              : AppText(
            text: trailingText,
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}