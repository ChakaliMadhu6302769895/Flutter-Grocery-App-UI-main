import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_widgets/app_text.dart';
import '../models/cartmodel.dart';
import '../models/grocery_item.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: AppText(
          text: "Favorite Items",
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black87,
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
                final item = cartModel.favoriteItems[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.description),
                      ],
                    ),
                    leading: Image.asset(
                      item.imagePath,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Handle favorite icon pressed
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            // Handle remove button pressed
                            removeItem(context, item);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void removeItem(BuildContext context, GroceryItem item) {
    // Implement the logic to remove the item from the favorite list
    Provider.of<CartModel>(context, listen: false).removeFromFavorites(item);
  }
}
