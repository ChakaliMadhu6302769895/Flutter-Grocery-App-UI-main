import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/category_item.dart';
import 'package:grocery_app/widgets/grocery_item_card_widget.dart';
import 'package:grocery_app/screens/product_details/product_details_screen.dart';

import '../models/grocery_item.dart';

class CategoryItemsScreen extends StatelessWidget {
  final CategoryItem categoryItem;

  CategoryItemsScreen({required this.categoryItem, });

  @override
  Widget build(BuildContext context) {
    List<GroceryItem> categoryProducts;

    if (categoryItem.name == "Tea,coffe\& more") {
      categoryProducts =tea;
    }  else if (categoryItem.name == "Snacks") {
      categoryProducts =biscuits;
    }else if (categoryItem.name == "Rice") {
      categoryProducts = Rice;
    } else if (categoryItem.name ==  "Atta\& Dals") {
      categoryProducts =  Flour;
    } else if (categoryItem.name =="Cooking Oil") {
      categoryProducts = cookingoils;
    } else if (categoryItem.name ==  "masala") {
      categoryProducts =masala;
    } else if (categoryItem.name == "Dry fruits") {
      categoryProducts =Dryfruits;
    } else if (categoryItem.name == "Bath,Body \& Hair") {
      categoryProducts = soapshampoo;
    } else if (categoryItem.name =="Beverages") {
      categoryProducts = beverages;
    } else if (categoryItem.name == "Cleaning Essentials") {
      categoryProducts = cleaningEssentials;
    } else {
      categoryProducts = [];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: categoryItem.name,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: categoryProducts.asMap().entries.map<Widget>((e) {
            GroceryItem groceryItem = e.value;
            return GestureDetector(
              onTap: () {
                onItemClicked(context, groceryItem);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: GroceryItemCardWidget(
                  item: groceryItem,
                  heroSuffix: "explore_screen",
                ),
              ),
            );
          }).toList(),
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 0.0,
        ),
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          groceryItem: groceryItem,
          heroSuffix: "explore_screen",
          cartItems: [],
          onItemsUpdated: (updatedItems) {
            // Handle the updated items as needed
          },
        ),
      ),
    );
  }
}
