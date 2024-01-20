class CategoryItem {
  final int? id;
  final String name;
  final String imagePath;

  CategoryItem({this.id, required this.name, required this.imagePath});
}

var categoryItemsDemo = [
  CategoryItem(
    name: "Snacks",
    imagePath: "assets/personal care.jpg",
  ),
  CategoryItem(
    name: "Tea, Coffee & More",
    imagePath: "assets/explore/tea.png",
  ),
  CategoryItem(
    name: "Rice",
    imagePath: "assets/images/rise.png",
  ),
  CategoryItem(
    name: "Atta & Dals",
    imagePath: "assets/attaanddhals/pulses.png",
  ),
  CategoryItem(
    name: "Cooking Oil",
    imagePath: "assets/explore/freedom_oil.png",
  ),
  CategoryItem(
    name: "Masala",
    imagePath: "assets/images/categories_images/meat.png",
  ),
  CategoryItem(
    name: "Dry Fruits",
    imagePath: "assets/dryfruits/dry_fruits.png",
  ),
  CategoryItem(
    name: "Bath, Body & Hair",
    imagePath: "assets/bodycare/bath.png",
  ),
  CategoryItem(
    name: "Beverages",
    imagePath: "assets/images/categories_images/beverages.png",
  ),
  CategoryItem(
    name: "Cleaning Essentials",
    imagePath: "assets/homecare/Harpic_1_Litre__Pack_of_2__Toilet_Cleaner_Liquid.png",
  ),
];
