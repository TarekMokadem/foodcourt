import 'package:foodcourt/constants/assets_constant.dart';
import 'package:foodcourt/models/cart_model.dart';
import 'package:foodcourt/models/category_model.dart';
import 'package:foodcourt/models/offer_model.dart';
import 'package:foodcourt/models/onboarding_model.dart';
import 'package:foodcourt/models/popular_model.dart';

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
