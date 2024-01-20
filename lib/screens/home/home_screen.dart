import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/screens/product_details/product_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/widgets/grocery_item_card_widget.dart';
import 'package:grocery_app/widgets/search_bar_widget.dart';
import '../../models/category_item.dart';
import '../../widgets/category_item_card_widget.dart';
import '../category_items_screen.dart';
import '../explore_screen.dart';
import 'home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  List<GroceryItem> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset("assets/icons/app_icon_color.svg"),
                  SizedBox(
                    height: 5,
                  ),
                  padded(locationWidget()),
                  SizedBox(
                    height: 15,
                  ),
                  padded(SearchBarWidget(onSearch: (query) {
                    print('Search query: $query');
                  },)),
                  SizedBox(
                    height: 25,
                  ),
                  padded(HomeBanner()),
                  padded(subTitle("Groceries")),
                  Container(
                    height: 105,
                    child:ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
                        int index = e.key;
                        CategoryItem categoryItem = e.value;
                        return GestureDetector(
                          onTap: () {
                            onCategoryItemClicked(context, categoryItem);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10), // Adjust the value to set the space between cards
                            child: Container(
                              child: CategoryItemCardWidget(
                                item: categoryItem,
                                color: gridColors[index % gridColors.length],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  padded(subTitle("Exclusive Order")),
                  getHorizontalItemSlider(exclusiveOffers),
                  SizedBox(height: 15),
                  padded(subTitle("Best Selling")),
                  getHorizontalItemSlider(bestSelling),
                  SizedBox(height: 15),

                  SizedBox(height: 15),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              item: items[index],
              heroSuffix: "home_screen",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          groceryItem: groceryItem,
          heroSuffix: "home_screen",
          cartItems: selectedItems,
          onItemsUpdated: (updatedItems) {
            // Handle the updated items as needed
          },
        ),
      ),
    );
  }


  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "scroll right",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget locationWidget() {
    String locationIconPath = "assets/icons/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "RR Nagar, Bangalore",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return CategoryItemsScreen(categoryItem:categoryItem,);
      },
    ));
  }
}


