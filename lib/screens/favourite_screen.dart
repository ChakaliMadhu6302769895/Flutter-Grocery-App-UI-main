import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_widgets/app_text.dart';
import '../models/cartmodel.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Set your desired green color
        title: AppText(
          text: "Favorite Items",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          // Check if there are favorite items
          if (cartModel.favoriteItems.isEmpty) {
            return Center(
              child: AppText(
                text: "No Favorite Items",
                fontWeight: FontWeight.w600,
                color: Color(0xFF7C7C7C),
              ),
            );
          } else {
            // Display a list of favorite items
            return ListView.builder(
              itemCount: cartModel.favoriteItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartModel.favoriteItems[index].name),
                  // Add other UI elements as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
