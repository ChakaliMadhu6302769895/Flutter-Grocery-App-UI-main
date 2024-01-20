import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/styles/colors.dart';
import 'navigator_item.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigatorItems[currentIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 37,
                offset: Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: navigatorItems.asMap().entries.map((entry) {
              final int index = entry.key;
              final NavigatorItem item = entry.value;
              return SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  item.iconPath,
                  color: currentIndex == index ? AppColors.primaryColor : Colors.black,
                ),
                title: Text(item.label),
                selectedColor: AppColors.primaryColor,
              );
            }).toList(),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
