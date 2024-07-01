import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaraunt extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
        name: 'Classic Cheeseburger',
        description: 'A juicy beef with melted cheddat inside',
        imagePath: 'lib/assets/burgers/cheesy-cheeseburger.jpg',
        price: 10.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),
    Food(
        name: 'Aloha Burger',
        description: 'An appetizing burger',
        imagePath: 'lib/assets/burgers/aloha_burger.png',
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),
    Food(
        name: 'Bluemoon Burger',
        description: 'A bluemoon burger',
        imagePath: 'lib/assets/burgers/bluemoon.jpg',
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),

    // salads

    Food(
        name: 'Caesar salad',
        description: 'A fresh salad',
        imagePath: 'lib/assets/salads/caesar.jpg',
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),
    Food(
        name: 'greek salad',
        description: 'A fresh salad',
        imagePath: 'lib/assets/salads/greek-salad.jpg',
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),

    // drinks

    Food(
        name: 'Lemonade',
        description: 'A cold fresh drink',
        imagePath: 'lib/assets/drinks/lemonade.jpg',
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),

    Food(
        name: 'Blueberry juice',
        description: 'A cold fresh blueberry juice',
        imagePath: 'lib/assets/drinks/blueberry.jpg',
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),

    // desserts

    Food(
        name: 'Apple pie',
        description: 'A hot soft pie with apples',
        imagePath: 'lib/assets/desserts/apple-pie.jpg',
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),

    Food(
        name: 'Pancakes',
        description: 'A sweet banana pacakes with honey',
        imagePath: 'lib/assets/desserts/pancakes.jpg',
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),

    //sides

    Food(
        name: 'Fried potatoes',
        description: 'A fried potatoes',
        imagePath: 'lib/assets/sides/fries.jpg',
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.04),
          Addon(name: "Bakon", price: 0.5),
          Addon(name: "Avocado", price: 0.2)
        ]),
  ];

  // user cart

  final List<CartItem> userCart = [];
  List<CartItem> get cart => userCart;
  // getters

  List<Food> get menu => _menu;

  void addToCart(Food food, List<Addon> selectedAddons) {
    int addedCartItemIndex = userCart.indexWhere(
        (item) => item.food == food && item.selectedAddons == selectedAddons);

    if (addedCartItemIndex != -1) {
      userCart[addedCartItemIndex].quantity += 1;
    } else {
      userCart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = userCart.indexWhere((item) => item == cartItem);
    if (cartIndex != -1) {
      if (userCart[cartIndex].quantity > 1) {
        userCart[cartIndex].quantity -= 1;
      } else {
        userCart.remove(cartItem);
      }
    }

    notifyListeners();
  }

  double get totalPriceOfCart {
    double totalPrice = userCart.fold(0, (sum, elem) => sum + elem.totalPrice);
    return totalPrice;
  }

  int get totalItemCount =>
      userCart.fold(0, (sum, elem) => sum += elem.quantity);

  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.price} (${_formatPrice(addon.price)})")
        .join(', ');
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('-------------');

    for (final cartItem in userCart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: $totalItemCount");
    receipt.writeln("Total Price: ${_formatPrice(totalPriceOfCart)}");

    return receipt.toString();
  }
}
