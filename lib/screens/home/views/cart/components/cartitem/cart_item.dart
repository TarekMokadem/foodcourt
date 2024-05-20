import '../../models/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    required this.quantity,
  });

  double get totalPrice {
    double total = food.price;
    for (Addon addon in selectedAddons) {
      total += addon.price;
    }
    return total * quantity;
  }
}