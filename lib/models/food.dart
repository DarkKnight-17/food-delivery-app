class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;

  Food(
      {required this.price,
      required this.description,
      required this.imagePath,
      required this.name,
      required this.availableAddons,
      required this.category});
}

enum FoodCategory {
  burgers,
  salads,
  desserts,
  drinks,
  sides,
}

class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}
