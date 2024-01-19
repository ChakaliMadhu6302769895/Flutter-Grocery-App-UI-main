import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/screens/cart/cart_screen.dart';
import 'package:grocery_app/widgets/item_counter_widget.dart';
import '../../models/cartmodel.dart';
import 'favourite_toggle_icon_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem groceryItem;
  final String? heroSuffix;
  final List<GroceryItem> cartItems;
  final Function(List<GroceryItem>) onItemsUpdated;

  ProductDetailsScreen({
    required this.groceryItem,
    this.heroSuffix,
    required this.cartItems,
    required this.onItemsUpdated,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isSelected = false;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    // Check if the current item is a favorite
    bool isFavorite = Provider.of<CartModel>(context).isFavorite(widget.groceryItem);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.groceryItem.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: AppText(
                        text: widget.groceryItem.description,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7C7C7C),
                      ),
                      trailing: FavoriteToggleIcon(
                        // Pass the initial favorite status
                        initialFavorite: isFavorite,
                        onFavoriteChanged: (isFavorite) {
                          updateFavoriteStatus(isFavorite);
                        },
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        ItemCounterWidget(
                          onAmountChanged: (newAmount) {
                            setState(() {
                              amount = newAmount;
                            });
                          },
                          initialAmount: amount,
                        ),
                        Spacer(),
                        Text(
                          "\Rs ${getTotalPrice().toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Divider(thickness: 1),
                    getProductDataRowWidget("Product Details"),
                    Divider(thickness: 1),
                    getProductDataRowWidget(
                      "Review",
                      customWidget: ratingWidget(),
                    ),
                    Spacer(),
                    AppButton(
                      label: "Add To Cart",
                      onPressed: () {
                        updateCartItem();
                        navigateToCartScreen();
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToCartScreen() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(
          cartItems: widget.cartItems,
          onItemsUpdated: (updatedItems) {
            widget.onItemsUpdated(updatedItems);
          },
          // Add a placeholder for onItemRemoved
          onItemRemoved: (removedItem) {
            // Handle onItemRemoved logic if needed
          },
        ),
      ),
    );

    // Update the cart items in ProductDetailsScreen after returning from CartScreen
    if (result != null && result is List<GroceryItem>) {
      widget.onItemsUpdated(result);
    }
  }

  void updateCartItem() {
    final existingCartItemIndex = widget.cartItems.indexWhere(
          (item) => item.id == widget.groceryItem.id,
    );

    if (existingCartItemIndex != -1) {
      widget.cartItems[existingCartItemIndex].quantity = amount;
    } else {
      widget.groceryItem.quantity = amount;
      // Use the CartModel to add the item to the cart
      Provider.of<CartModel>(context, listen: false).addToCart(widget.groceryItem);
    }
  }

  void updateFavoriteStatus(bool isFavorite) {
    // Implement the logic to update the list of favorite items
    // You can use a Provider or any other state management solution here
    // For simplicity, let's assume there's a method addToFavorites in CartModel
    if (isFavorite) {
      Provider.of<CartModel>(context, listen: false).addToFavorites(widget.groceryItem);
    } else {
      Provider.of<CartModel>(context, listen: false).removeFromFavorites(widget.groceryItem);
    }
  }

  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF3366FF).withOpacity(0.1),
            const Color(0xFF3366FF).withOpacity(0.09),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Hero(
        tag: "GroceryItem:" + widget.groceryItem.name + "-" + (widget.heroSuffix ?? ""),
        child: Image(
          image: AssetImage(widget.groceryItem.imagePath),
        ),
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          Spacer(),
          if (customWidget != null) ...[
            customWidget,
            SizedBox(
              width: 20,
            )
          ],
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  double getTotalPrice() {
    return amount * widget.groceryItem.price;
  }
}
