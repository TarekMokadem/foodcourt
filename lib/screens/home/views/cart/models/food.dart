// food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<FoodBrand> brand;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.brand,
    required this.availableAddons,
  });

  @override
  String toString() {
    return 'Food{name: $name, description: $description, imagePath: $imagePath, price: $price, category: $category, brand: $brand, availableAddons: $availableAddons}';
  }
}


// food categories

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}
// food brand

enum FoodBrand {
  wolly,
  pokenio,
  marache,
  pizzatime,
  ppg,
}

// food addons
class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}