import 'package:foodcourt/constants/assets_constant.dart';
import 'package:foodcourt/models/cart_model.dart';
import 'package:foodcourt/models/category_model.dart';
import 'package:foodcourt/models/offer_model.dart';
import 'package:foodcourt/models/onboarding_model.dart';
import 'package:foodcourt/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:foodcourt/screens/home/views/cart/components/cartitem/cart_item.dart';
import 'package:get/get.dart';
import '../screens/home/views/cart/components/cartitem/food_item.dart';
import '../screens/home/views/cart/models/food.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';


List<OnboardingInfoData> onboardingData = [
  OnboardingInfoData(
    image: Assets.onb1,
    title: 'Bringing joy to your door.',
    subtitle:
        '''foodcourt is here to deliver only joy to you, our services are top notch and our meals are totally irresistible.''',
  ),
  OnboardingInfoData(
    image: Assets.onb2,
    title: 'Don’t starve, just order.',
    subtitle:
        '''Loved one, you don’t need to starve today. foodcourt is here to satisfy your cravings for a good meal, just order!''',
  ),
  OnboardingInfoData(
    image: Assets.onb3,
    title: 'Good food in minutes.',
    subtitle:
        '''You can trust us to get your next meal in few minutes. We deliver when you need it the most, no more starving for you.''',
  ),
];

List<OfferModel> offerData = [
  OfferModel(
    percentOff: 50,
    offer: 'Offer for only today when you order 3 packs of pizza',
    image: Assets.pizza1,
  ),
  OfferModel(
    percentOff: 30,
    offer: 'Offer today on our cakes to brighten your celebration.',
    image: Assets.cake1,
  )
];

//categoryData by default 
List<CategoryModel> categoryData = [
  CategoryModel(
    category: 'Fast Food',
    image: Assets.fastFood,
  ),
  CategoryModel(
    category: 'Sea Food',
    image: Assets.seaFood,
  ),
  CategoryModel(
    category: 'Pizza',
    image: Assets.pizza1,
  ),
  CategoryModel(
    category: 'Fruits',
    image: Assets.fruits,
  ),
];

//categoryData for pizza time (pizza tomate, crèmes frèches, spéciales, etc..)
List<CategoryModel> categoryDataPizza = [
  CategoryModel(
    category: 'Pizza Sauce Tomate',
    image: Assets.pizzaQFromages,
  ),
  CategoryModel(
    category: 'Pizza Crème Fraîche',
    image: Assets.pizzaChevreMiel,
  ),
  CategoryModel(
    category: 'Pizza Spéciales',
    image: Assets.pizza1,
  ),
  CategoryModel(
    category: 'Finger Food',
    image: Assets.fruits,
  ),
];

//popularData by default 
List<PopularModel> popularData = [
  PopularModel(
    title: 'African Salad',
    deliveryTime: 10,
    price: 20,
    image: Assets.salad,
  ),
  PopularModel(
    title: 'Jellof Rice',
    deliveryTime: 15,
    price: 35,
    image: Assets.jollofRice,
  ),
  PopularModel(
    title: 'Pizza',
    deliveryTime: 5,
    price: 12,
    image: Assets.pizza2,
  ),
];

//popularData for pizza time
List<PopularModel> popularDataPizza = [
  PopularModel(
    title: 'La Pimento',
    deliveryTime: 12,
    price: 11.90,
    image: Assets.pizzaPimento,
    desc: "Sauce chili thai, fromage, sauce tomate, poulet mariné, pepperoni de boeuf, piments forts, poivrons",
  ),
  PopularModel(
    title: 'La Bolywood',
    deliveryTime: 15,
    price: 11.70,
    image: Assets.jollofRice,
    desc: "Crème fraîche, fromage, sauce curry, poivrons, oignons rouges, poulet mariné",
  ),
  PopularModel(
    title: 'La Campagnarde',
    deliveryTime: 5,
    price: 11.70,
    image: Assets.pizza2,
    desc: "Crème fraîche, fromage, jambon (de poulet), pomme de terre, champignons, boursin",
  ),
  PopularModel(
    title: 'La Campagnarde',
    deliveryTime: 5,
    price: 11.70,
    image: Assets.pizza2,
    desc: "Crème fraîche, fromage, jambon (de poulet), pomme de terre, champignons, boursin",
  ),
  PopularModel(
    title: 'La Pimento',
    deliveryTime: 12,
    price: 11.90,
    image: Assets.pizzaPimento,
    desc: "Sauce chili thai, fromage, sauce tomate, poulet mariné, pepperoni de boeuf, piments forts, poivrons",
  ),
  PopularModel(
    title: 'La Bolywood',
    deliveryTime: 15,
    price: 11.70,
    image: Assets.jollofRice,
    desc: "Crème fraîche, fromage, sauce curry, poivrons, oignons rouges, poulet mariné",
  ),
  PopularModel(
    title: 'La Campagnarde',
    deliveryTime: 5,
    price: 11.70,
    image: Assets.pizza2,
    desc: "Crème fraîche, fromage, jambon (de poulet), pomme de terre, champignons, boursin",
  ),
  PopularModel(
    title: 'La Campagnarde',
    deliveryTime: 5,
    price: 11.70,
    image: Assets.pizza2,
    desc: "Crème fraîche, fromage, jambon (de poulet), pomme de terre, champignons, boursin",
  ),
  PopularModel(
    title: 'La Pimento',
    deliveryTime: 12,
    price: 11.90,
    image: Assets.pizzaPimento,
    desc: "Sauce chili thai, fromage, sauce tomate, poulet mariné, pepperoni de boeuf, piments forts, poivrons",
  ),
  PopularModel(
    title: 'La Bolywood',
    deliveryTime: 15,
    price: 11.70,
    image: Assets.jollofRice,
    desc: "Crème fraîche, fromage, sauce curry, poivrons, oignons rouges, poulet mariné",
  ),
  PopularModel(
    title: 'La Campagnarde',
    deliveryTime: 5,
    price: 11.70,
    image: Assets.pizza2,
    desc: "Crème fraîche, fromage, jambon (de poulet), pomme de terre, champignons, boursin",
  ),
  PopularModel(
    title: 'La Campagnarde',
    deliveryTime: 5,
    price: 11.70,
    image: Assets.pizza2,
    desc: "Crème fraîche, fromage, jambon (de poulet), pomme de terre, champignons, boursin",
  ),
];

List<Cart> cartData = [
  Cart(
    image: Assets.cheezePizza,
    title: 'Cheese Pizza',
    desc:
        'Our Cheeze Pizza is baked specially for you, with pure natural and fresh ingredients to satisfy your cravings while maintaining your healthy living.',
    price: 12,
    rating: 4.5,
  ),
  Cart(
    image: Assets.veggiePizza,
    title: 'Veggie Pizza',
    desc:
        '''Our Veggie Pizza is baked specially for you, with pure natural and fresh ingredients to satisfy your cravings while maintaining your healthy living.''',
    price: 15,
    rating: 3.5,
  ),
  Cart(
    image: Assets.meatPizza,
    title: 'Meat Pizza',
    desc:
        '''Our Meat Pizza is baked specially for you, with pure natural and fresh ingredients to satisfy your cravings while maintaining your healthy living.''',
    price: 20,
    rating: 4.5,
  ),
  Cart(
    image: Assets.pepperoniPizza,
    title: 'Pepperoni Pizza',
    desc:
        'Our Pepperoni Pizza is baked specially for you, with pure natural and fresh ingredients to satisfy your cravings while maintaining your healthy living.',
    price: 16,
    rating: 5,
  ),
];


class Menu extends ChangeNotifier {

  // list of food menu
  final List<Food> _menu= [
    // Burger
    Food(
      name: 'Cheese Burger',
      description: 'Beef patty, cheese, lettuce, tomato, pickles, onions, mayo, ketchup',
      imagePath: 'assets/images/burgers/AI-generated_burger.png',
      price: 5.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
        Addon(name: 'Extra Onions', price: 0.25),
        Addon(name: 'Extra Mayo', price: 0.25),
        Addon(name: 'Extra Ketchup', price: 0.25),
        Addon(name: 'Extra Lettuce', price: 0.25),
      ],
    ),
    Food(
      name: 'Chicken Burger',
      description: 'Grilled chicken, lettuce, tomato, pickles, onions, mayo, ketchup',
      imagePath: 'assets/images/burgers/AI-generated_chicken_burger.png',
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
        Addon(name: 'Extra Onions', price: 0.25),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description: 'Veggie patty, lettuce, tomato, pickles, onions, mayo, ketchup',
      imagePath: 'assets/images/burgers/AI-generated_veggie_burger.png',
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Veggie Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
        Addon(name: 'Extra Onions', price: 0.25),
      ],
    ),

    Food(
      name: 'Fish Burger',
      description: 'Breaded fish fillet, lettuce, tomato, pickles, onions, tartar sauce',
      imagePath: 'assets/images/burgers/AI-generated_fish_burger.png',
      price: 7.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Fish Fillet', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
        Addon(name: 'Extra Onions', price: 0.25),
      ],
    ),

    // Salad
    Food(
      name: 'Chicken Salad',
      description: 'Grilled chicken, lettuce, tomato, cucumber, croutons, ranch dressing',
      imagePath: 'assets/images/salads/AI-generated_chicken_salad.png',
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Croutons', price: 0.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ],
    ),
    Food(
      name: 'Caesar Salad',
      description: 'Romaine lettuce, croutons, parmesan cheese, Caesar dressing',
      imagePath: 'assets/images/salads/AI-generated_caesar_salad.png',
      price: 5.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Croutons', price: 0.50),
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ],
    ),
    Food(
      name: 'Garden Salad',
      description: 'Mixed greens, tomato, cucumber, carrots, red cabbage, choice of dressing',
      imagePath: 'assets/images/salads/AI-generated_garden_salad.png',
      price: 4.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Tomato', price: 0.25),
        Addon(name: 'Extra Cucumber', price: 0.25),
        Addon(name: 'Extra Dressing', price: 0.25),
      ],
    ),
    // Sides
    Food(
      name: 'French Fries',
      description: 'Crispy fried potatoes',
      imagePath: 'assets/images/sides/ai-generated-fries.png',
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Salt', price: 0.25),
        Addon(name: 'Extra Ketchup', price: 0.25),
        Addon(name: 'Extra Mayo', price: 0.25),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Battered and fried onion rings',
      imagePath: 'assets/images/sides/ai-generated-onion-rings.png',
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Salt', price: 0.25),
        Addon(name: 'Extra Ketchup', price: 0.25),
        Addon(name: 'Extra Mayo', price: 0.25),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: 'Breaded and fried mozzarella cheese sticks',
      imagePath: 'assets/images/sides/ai-generated-mozzarella-sticks.png',
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Marinara Sauce', price: 0.50),
        Addon(name: 'Extra Ranch Dressing', price: 0.25),
        Addon(name: 'Extra Ketchup', price: 0.25),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Toasted bread with garlic butter',
      imagePath: 'assets/images/sides/ai-generated-garlic-bread.png',
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Butter', price: 0.25),
        Addon(name: 'Extra Garlic', price: 0.25),
        Addon(name: 'Extra Salt', price: 0.25),
      ],
    ),
    // Desserts
    Food(
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with chocolate frosting',
      imagePath: 'assets/images/desserts/ai-generated-chocolat_cake.png',
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Frosting', price: 0.50),
        Addon(name: 'Extra Chocolate Chips', price: 0.25),
        Addon(name: 'Extra Sprinkles', price: 0.25),
      ],
    ),
    Food(
      name: 'Cheesecake',
      description: 'Creamy cheesecake with graham cracker crust',
      imagePath: 'assets/images/desserts/ai-generated-cheesecake.png',
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Whipped Cream', price: 0.50),
        Addon(name: 'Extra Cherry Topping', price: 0.25),
        Addon(name: 'Extra Chocolate Sauce', price: 0.25),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description: 'Warm apple pie with flaky crust',
      imagePath: 'assets/images/desserts/ai-generated-apple-pie.png',
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Whipped Cream', price: 0.50),
        Addon(name: 'Extra Caramel Sauce', price: 0.25),
        Addon(name: 'Extra Ice Cream', price: 0.25),
      ],
    ),
    Food(
      name: 'Ice Cream',
      description: 'Vanilla, chocolate, strawberry, mint chocolate chip',
      imagePath: 'assets/images/desserts/ai-generated-ice-cream.png',
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Sprinkles', price: 0.25),
        Addon(name: 'Extra Chocolate Sauce', price: 0.25),
        Addon(name: 'Extra Whipped Cream', price: 0.25),
      ],
    ),
    Food(
      name: 'Brownie',
      description: 'Fudgy chocolate brownie with walnuts',
      imagePath: 'assets/images/desserts/ai-generated-brownie.png',
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Walnuts', price: 0.50),
        Addon(name: 'Extra Chocolate Chips', price: 0.25),
        Addon(name: 'Extra Caramel Sauce', price: 0.25),
      ],
    ),
    // Drinks
    Food(
      name: 'Soda',
      description: 'Coke, Pepsi, Sprite, Dr. Pepper, Mountain Dew',
      imagePath: 'assets/images/drinks/ai-generated-raspberry-coktail.png',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Ice', price: 0.25),
        Addon(name: 'Extra Lemon', price: 0.25),
        Addon(name: 'Extra Straw', price: 0.25),
      ],
    ),
    Food(
      name: 'Iced Tea',
      description: 'Sweet, unsweet, raspberry, peach, lemon',
      imagePath: 'assets/images/drinks/ai-generated-iced-tea.png',
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Ice', price: 0.25),
        Addon(name: 'Extra Lemon', price: 0.25),
        Addon(name: 'Extra Straw', price: 0.25),
      ],
    ),
    Food(
      name: 'Coffee',
      description: 'Black, latte, cappuccino, espresso, macchiato',
      imagePath: 'assets/images/drinks/ai-generated-coffee.png',
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Sugar', price: 0.25),
        Addon(name: 'Extra Cream', price: 0.25),
        Addon(name: 'Extra Syrup', price: 0.25),
      ],
    ),
    Food(
      name: 'Milkshake',
      description: 'Chocolate, vanilla, strawberry, banana, Oreo',
      imagePath: 'assets/images/drinks/ai-generated-milkshake.png',
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Whipped Cream', price: 0.50),
        Addon(name: 'Extra Cherry', price: 0.25),
        Addon(name: 'Extra Sprinkles', price: 0.25),
      ],
    ),
    Food(
      name: 'Smoothie',
      description: 'Berry, tropical, green, protein, detox',
      imagePath: 'assets/images/drinks/ai-generated-smoothie.png',
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Protein Powder', price: 0.50),
        Addon(name: 'Extra Spinach', price: 0.25),
        Addon(name: 'Extra Chia Seeds', price: 0.25),
      ],
    ),
    Food(
      name: 'Water',
      description: 'Still, sparkling, flavored, bottled, tap',
      imagePath: 'assets/images/drinks/ai-generated-water.png',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Ice', price: 0.25),
        Addon(name: 'Extra Lemon', price: 0.25),
        Addon(name: 'Extra Straw', price: 0.25),
      ],
    ),
    Food(
      name: 'Limonade',
      description: 'Lime, lemon, orange, grapefruit, raspberry',
      imagePath: 'assets/images/drinks/ai-generated-limonade.png',
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Lime', price: 0.25),
        Addon(name: 'Extra Sugar', price: 0.25),
        Addon(name: 'Extra Ice', price: 0.25),
      ],
    ),
  ];

  /*GETTER*/

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  /*OPERATIONS*/

  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // create cart item
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons, quantity: 1));
    }
    notifyListeners();

  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //remove all from cart
  void removeAllFromCart(CartItem cartItem) {
    if (_cart.contains(cartItem)) {
      _cart.remove(cartItem);
    }
    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*HELPERS*/

  // generate a receipt
  String displayCartReceipt(){
    final receipt= StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln('----------------------');

    //format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm:ss').format(DateTime.now());

    receipt.writeln('Date: $formattedDate');
    receipt.writeln();
    receipt.writeln('----------------------');

    for (final cartItem in _cart){
      receipt.writeln('${cartItem.quantity}x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}');
      receipt.writeln('Description: ${cartItem.food.description}');
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln('Addons: ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }


    receipt.writeln();
    receipt.writeln('----------------------');
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return '${price.toStringAsFixed(2)}€';
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(', ');
  }

}