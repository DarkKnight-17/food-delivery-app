import 'package:food_delivery_app/models/food.dart';

class CartItem {
  Food food;
  int quantity = 1;
  List<Addon> selectedAddons;

  CartItem({
    required this.food,
    required this.selectedAddons,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
