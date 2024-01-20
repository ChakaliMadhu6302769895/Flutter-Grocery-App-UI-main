

class GroceryItem {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  int quantity;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.quantity = 0,
  });
}

var demoItems = [
  GroceryItem(
      id: 1,
      name: "Sprite",
      description: " 2.25 lit",
      price: 94,
      imagePath: "assets/beverages/sprite_2L.png"),
  GroceryItem(
      id: 2,
      name: "Thumsup",
      description: " 2.25 lit",
      price: 96,
      imagePath: "assets/beverages/thumsup 2L (1).webp"),
  GroceryItem(
      id: 3,
      name: "Lays",
      description: "1,200 gm",
      price: 30,
      imagePath: "assets/explore/lays.webp"),
  GroceryItem(
      id: 4,
      name: "Good Day",
      description: " 150 gm",
      price: 43,
      imagePath:"assets/explore/good_day.png"),
  GroceryItem(
      id: 5,
      name: "atta",
      description: " 1 kg",
      price: 60,
      imagePath: "assets/explore/aashirvaad_atta.png"),
  GroceryItem(
      id: 6,
      name: "Freedom oil",
      description: " 1000ml",
      price:130 ,
      imagePath: "assets/explore/freedom_oil.png"),
  GroceryItem(
      id: 7,
      name: "Sugar",
      description: " 500 gm",
      price: 24,
      imagePath:"assets/explore/suger.png"),
  GroceryItem(
      id: 8,
      name: "Salt",
      description: "1kg",
      price: 15,
      imagePath:"assets/explore/salt.png"),
];

var exclusiveOffers = [demoItems[0], demoItems[1],demoItems[2], demoItems[3]];

var bestSelling = [demoItems[4], demoItems[5],demoItems[6], demoItems[7]];

var groceries = [];

var beverages = [

  GroceryItem(
      id: 1,
      name: "Apple Juice",
      description: "2 lit, Price",
      price: 109,
      imagePath: "assets/beverages/apple_and_grape_juice.png"),
  GroceryItem(
      id: 2,
      name: "Orange Juice",
      description: "2 lit, Price",
      price: 96,
      imagePath: "assets/beverages/orange_juice.png"),
  GroceryItem(
      id: 3,
      name: "Coca Cola Can",
      description: "325ml, Price",
      price: 42,
      imagePath: "assets/beverages/coca_cola.png"),
  GroceryItem(
      id: 4,
      name: "Pepsi Can",
      description: "325ml, Price",
      price: 42,
      imagePath: "assets/beverages/pepsi.png"),
  GroceryItem(
      id: 5,
      name: "Diet Coke",
      description: "325 ml, Price",
      price: 39,
      imagePath: "assets/beverages/diet_coke.png"),
  GroceryItem(
      id: 6,
      name: "sprite",
      description: "325 ml, Price",
      price: 40,
      imagePath: "assets/beverages/sprite.png"),

  GroceryItem(
      id: 7,
      name: "Thumsup",
      description: "2.25 lit, Price",
      price: 99,
      imagePath: "assets/beverages/thumsup 2L (1).webp"),
  GroceryItem(
      id: 8,
      name: "Thumsup",
      description: "1.25, Price",
      price: 65,
      imagePath: "assets/beverages/beverages_images/pepsi.png"),
  GroceryItem(
      id: 9,
      name: "sprite",
      description: "2.25 lit, Price",
      price: 93,
      imagePath: "assets/beverages/sprite_2L.png"),
  GroceryItem(
      id: 10,
      name: "sprite",
      description: "1.25 lit, Price",
      price: 60,
      imagePath: "assets/beverages/beverages_images/pepsi.png"),
  GroceryItem(
      id: 11,
      name: "pulpy orange",
      description: "1.25 lit, Price",
      price: 50,
      imagePath: "assets/beverages/beverages_images/pepsi.png"),
  GroceryItem(
      id: 12,
      name: "soda",
      description: "750 ml, Price",
      price: 4.99,
      imagePath: "assets/beverages/kinley-sparkling-water-club-soda 20rs.jpg"),

];
var tea= [
  GroceryItem(
      id: 1,
      name: "Bru",
      description: " 20gm",
      price: 2,
      imagePath: "assets/tea/bru.jpg"),
  GroceryItem(
      id: 2,
      name: "Taj mahal",
      description: " 200gm",
      price: 70,
      imagePath: "assets/tea/tajmahal.jpg"),
  GroceryItem(
      id: 3,
      name: "3 roses",
      description: " 200gm",
      price: 65,
      imagePath: "assets/tea/3roses.jpg"),
  GroceryItem(
      id: 4,
      name: "continantal",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 5,
      name: "Tata Tea Agni",
      description: " 500gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 6,
      name: "Red label",
      description: " 250gm",
      price: 5,
      imagePath: "assets/tea/tea.png"),
  GroceryItem(
      id: 7,
      name: "Tetley Green Tea",
      description: " 35gm , 25 bags",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 8,
      name: "Lipton Green",
      description: " 35gm , 25 bags",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 9,
      name: "Tata coffee Gold",
      description: " 50gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 10,
      name: "Quick filter Coffee",
      description: " 50gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
];
var Flour = [
  GroceryItem(
      id: 1,
      name: "Wheatflour",
      description: "1kg, Price",
      price: 59,
      imagePath: "assets/attaanddhals/aashirvaad_atta.png"),
  GroceryItem(
      id: 2,
      name: "Cornflour",
      description: "500gm, Price",
      price: 38,
      imagePath: "assets/images/flour_images/cornflour.png"),
  GroceryItem(
      id: 3,
      name: "Fortune chakki fresh atta",
      description: "250gm, Price",
      price: 50,
      imagePath: "assets/images/flour_images/karuppukavunirice.png"),
  GroceryItem(
      id: 4,
      name: "maida",
      description: "500gm, Price",
      price: 26,
      imagePath: "assets/images/flour_images/dal.png"),
  GroceryItem(
      id: 5,
      name: "Ragi flour organic",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 6,
      name: "Fine Basan",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 7,
      name: "chana dal",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 8,
      name: "moong dal",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 9,
      name: "masoor dal",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
  GroceryItem(
      id: 10,
      name: "toor dal(arhar dal)",
      description: " 35gm",
      price: 5,
      imagePath: "assets/tea/contintal.jpg"),
];
var masala = [
  GroceryItem(
      id: 1,
      name: "Catch Chat Masala",
      description: "100gm, Price",
      price: 12,
      imagePath: "assets/images/masala_images/chat.jpeg"),
  GroceryItem(
      id: 2,
      name: "Eastren Chicken Masala",
      description: "100gm, Price",
      price: 9,
      imagePath: "assets/images/masala_images/masala.jpeg"),
  GroceryItem(
      id: 3,
      name: "Eastern Meat Masala",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
  GroceryItem(
      id: 4,
      name: "Garam Masala",
      description: "100gm, Price",
      price: 11,
      imagePath: "assets/images/masala_images/sabzi.jpeg"),
  GroceryItem(
      id: 5,
      name: "Biryani Masala",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
  GroceryItem(
      id: 6,
      name: "kebab Masala",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
  GroceryItem(
      id: 7,
      name: "Egg Masala",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
  GroceryItem(
      id: 8,
      name: "Vegetable Masala",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
  GroceryItem(
      id: 9,
      name: "Fish Masala",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
  GroceryItem(
      id: 10,
      name: "Coriander powder",
      description: "100 gm, Price",
      price: 15,
      imagePath: "assets/images/masala_images/meat.jpeg"),
];
var biscuits = [
  GroceryItem(
      id: 1,
      name: "Oreo",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/cookies_images/cookies.png"),
  GroceryItem(
      id: 2,
      name: "GoodDay",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/cookies_images/goodday.png"),
  GroceryItem(
      id: 3,
      name: "Hide and Seek",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/cookies_images/hideandseek.png"),
  GroceryItem(
      id: 4,
      name: "Bour bon",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/cookies_images/marielight.png"),
  GroceryItem(
      id: 5,
      name: "Unibic",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/cookies_images/unibic.png"),
  GroceryItem(
      id: 6,
      name: "Hulke fulke",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/chips_images/bananachips.png"),
  GroceryItem(
      id: 7,
      name: "Bingo",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/chips_images/bingo.png"),
  GroceryItem(
      id: 8,
      name: "pringles",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/chips_images/diamondchips.png"),
  GroceryItem(
      id: 9,
      name: "Lays",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/chips_images/lays.png"),
  GroceryItem(
      id: 10,
      name: "Too Yumm",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/chips_images/tooyummchips.png"),
];
var soapshampoo = [
  GroceryItem(
      id: 1,
      name: "Vaseline",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/babysoap.png"),
  GroceryItem(
      id: 2,
      name: "Nivea Body lotion",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/handwash.png"),
  GroceryItem(
      id: 3,
      name: "Dettol",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/lotion.png"),
  GroceryItem(
      id: 4,
      name: "Santoor",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/shampoo.png"),
  GroceryItem(
      id: 5,
      name: "Chinthol",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/soap.png"),
  GroceryItem(
      id: 6,
      name: "Head & shoulder",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/soap.png"),
  GroceryItem(
      id: 7,
      name: "Clinic Plus",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/soap.png"),
  GroceryItem(
      id: 8,
      name: "Meera",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/soap.png"),
  GroceryItem(
      id: 9,
      name: "FOGG",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/soap.png"),
  GroceryItem(
      id: 10,
      name: "PARK AVENUE",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/soap_images/soap.png"),

];
var cleaningEssentials = [
  GroceryItem(
      id: 1,
      name: "Harpic",
      description: "1 lit, Price",
      price: 78,
      imagePath: "assets/homecare/Harpic_1_Litre__Pack_of_2__Toilet_Cleaner_Liquid.png"),
  GroceryItem(
      id: 2,
      name: "Colin",
      description: "500ml, Price",
      price: 54,
      imagePath: "assets/homecare/Colin_500_ml__Glass_and_Surface_Cleaner_Liquid_Spray.png"),
  GroceryItem(
      id: 3,
      name: "VIM Liquid",
      description: "2 lit, Price",
      price: 237,
      imagePath: "assets/homecare/Vim_Dishwash_Liquid_Gel_Lemon_Refill_Pouch__2_Ltr.png"),
  GroceryItem(
      id: 4,
      name: "VIM Soap",
      description: "150gm, Price",
      price: 18,
      imagePath: "assets/homecare/Vim_Dishwash_Bar_Lemon.png"),
  GroceryItem(
      id: 5,
      name: "Rin Soap",
      description: "150gm, Price",
      price: 87,
      imagePath: "assets/homecare/Rin_Detergent_Bar_-_150g_Pack__15g_.png"),
  GroceryItem(
      id: 6,
      name: "lizol",
      description: "80gm, Price",
      price: 13,
      imagePath: "assets/homecare/Surf_Excel_Detergent_Bar_-_80g.png"),
  GroceryItem(
      id: 7,
      name: "Surf excel powder",
      description: "1 kg, Price",
      price: 45,
      imagePath: "assets/homecare/Surf_Excel_Easy_Wash_Detergent_Powder.png"),
  GroceryItem(
      id: 8,
      name: "Surf excel soap",
      description: "250 gm, Price",
      price: 27,
      imagePath: "assets/homecare/Surf_Excel_Detergent_Bar_250_g.png"),
  GroceryItem(
      id: 9,
      name: "Ariel liquid",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/homecare/Ariel_Top_Load_Matic_Liquid_Detergent_3.2_Ltr-removebg-preview.png"),
  GroceryItem(
      id: 10,
      name: "Surf excel liquid",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/homecare/Surf_Excel_Matic_Top_Load_Liquid_Detergent_1L-removebg-preview.png"),
];
var Dryfruits = [
  GroceryItem(
      id: 1,
      name: "Raisins",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/Tata_Sampann_Pure_Raisins_Seedless__Kishmish__Source_Of_Potassium__Premium_Dry_Fruits__200g.png"),
  GroceryItem(
      id: 2,
      name: "Cashews",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/Tata_Sampann_Pure_Cashews_Whole__Kaju__Rich_in_Protein__Magnesium___Phosphorus__Deluxe_Size___Crunchy_Nuts__200g-.png"),
  GroceryItem(
      id: 3,
      name: "Almonds",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/Tata_Sampann_Pure_California_Almonds_Whole_500g-.png"),
  GroceryItem(
      id: 4,
      name: "Brazil Nuts",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/RiTrue_-_Exotic_Brazil_Nuts_-_250_Gm.png"),
  GroceryItem(
      id: 5,
      name: "Walnuts",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/Tata_Sampann_Pure_Walnuts__Crunchy_Nuts__Rich_in_Dietary_Fibre__Protein___Magnesium__200g.png"),
  GroceryItem(
      id: 6,
      name: "Lion Dates ",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/Lion_Qyno_Deseeded_Dates__500g.png"),
  GroceryItem(
      id: 7,
      name: "Anjeer",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/dryfruits/Happilo_Premium_Dried_Afghani_Anjeer_200g.png"),
];
var cookingoils = [
  GroceryItem(
      id: 1,
      name: "Fortune sunflower oil",
      description: "106, Price",
      price: 106,
      imagePath: "assets/oils/Fortune_Sunlite_Refined_Sunflower_Oil__1L-removebg-preview.png"),
  GroceryItem(
      id: 2,
      name: "Gold drop sunflower oil",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/oils/cleaningessential/cleaning2.png"),
  GroceryItem(
      id: 3,
      name: "saffola gold Refined oil",
      description: "1 lit, Price",
      price: 99,
      imagePath: "assets/oils/Saffola_Gold_Refined_Oil-removebg-preview.png"),
  GroceryItem(
      id: 4,
      name: "freedom oil",
      description: "1 lit, Price",
      price: 136,
      imagePath: "assets/oils/freedom_oil.png"),
  GroceryItem(
      id: 5,
      name: "Ruchi gold",
      description: "1 lit, Price",
      price: 95,
      imagePath: "assets/oils/Ruchi_Gold_Palmolein_Oil_for_Cooking_870gm-removebg-preview.png"),
  GroceryItem(
      id: 6,
      name: "Freedom Rice brand oil",
      description: "1 lit, Price",
      price: 112,
      imagePath: "assets/oils/Freedom_Rice_Bran_Oil_1lt-removebg-preview.png"),
  GroceryItem(
      id: 7,
      name: "Freedom refined oil ",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/oils/cleaningessential/cleaning5.png"),
  GroceryItem(
      id: 8,
      name: "Freedom Ground nut oil",
      description: "5 lit, Price",
      price: 540,
      imagePath: "assets/oils/Liquid_5L_Freedom_Groundnut_Oil_-removebg-preview.png"),
  GroceryItem(
      id: 9,
      name: "Gold winner",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/oils/cleaningessential/cleaning5.png"),
  GroceryItem(
      id: 10,
      name: "Fortune Rice bran",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/oils/cleaningessential/cleaning5.png"),
];
var Rice = [
  GroceryItem(
      id: 1,
      name: "India gate ",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/rice/cleaningessential/cleaning1.jpeg"),
  GroceryItem(
      id: 2,
      name: "India gate ROzona",
      description: "5 kg, Price",
      price: 437,
      imagePath: "assets/rice/India_Gate_Basmati_Rice_Rozana__5kg-removebg-preview.png"),
  GroceryItem(
      id: 3,
      name: "Dawaat",
      description: "5 kg, Price",
      price: 412,
      imagePath: "assets/rice/Daawat_Super__Perfectly_Aged__Long_Grain_with_Rich_Aroma_Basmati_Rice__5_Kg-removebg-preview.png"),
  GroceryItem(
      id: 4,
      name: "Kohinoor charminar",
      description: "5 kg, Price",
      price: 403,
      imagePath: "assets/rice/Kohinoor_Charminar_Rozana_Basmati_Rice_5_KG-removebg-preview.png"),
  GroceryItem(
      id: 5,
      name: "Dawaat sonamasoori",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/rice/cleaningessential/cleaning5.png"),
  GroceryItem(
      id: 6,
      name: "Lachkari wada kolam rice",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/rice/cleaningessential/cleaning5.png"),

];