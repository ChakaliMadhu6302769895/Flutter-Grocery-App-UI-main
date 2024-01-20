import 'package:flutter/material.dart';
import '../../common_widgets/app_text.dart';
import '../../styles/colors.dart';



class GroceryFeaturedItem {
  final  int? id;
  final String name;
  final String imagePath;

  GroceryFeaturedItem({this.id, required this.name, required this.imagePath});

}

var groceryFeaturedItems = [
  GroceryFeaturedItem(
    name: "snakes",
    imagePath: "assets/images/categories_images/fruit.png",
  ),
  GroceryFeaturedItem(
    name: "Rice",
    imagePath: "assets/images/categories_images/beverages.png",
  ),
  GroceryFeaturedItem(
    name:"staples",
    imagePath: "assets/images/categories_images/beverages.png",
  ),
  GroceryFeaturedItem(
    name:"Daily Needs",
    imagePath: "assets/images/categories_images/oil.png",
  ),
  GroceryFeaturedItem(
    name:"Cosmetics",
    imagePath: "assets/images/categories_images/meat.png",
  ),
  GroceryFeaturedItem(
    name:"Homecare",
    imagePath: "assets/images/categories_images/bakery.png",
  ),
  GroceryFeaturedItem(
    name: "Body Care",
    imagePath: "assets/images/categories_images/dairy.png",
  ),
  GroceryFeaturedItem(
    name: "Beverages",
    imagePath: "assets/images/categories_images/beverages.png",
  ),
  GroceryFeaturedItem(
    name: "Stationary",
    imagePath: "assets/images/categories_images/beverages.png",
  ),
];

class GroceryFeaturedCard extends StatelessWidget {
  const GroceryFeaturedCard(this.groceryFeaturedItem,
      {this.color = AppColors.primaryColor});

  final GroceryFeaturedItem groceryFeaturedItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 105,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
      decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Image(
            image: AssetImage(groceryFeaturedItem.imagePath),
          ),
          SizedBox(
            width: 15,
          ),
          AppText(
            text: groceryFeaturedItem.name,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
