import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIcrement;
  final VoidCallback onDecrement;

  const QuantitySelector(
      {super.key,
      required this.food,
      required this.onDecrement,
      required this.onIcrement,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: onDecrement,
              child: Icon(Icons.remove,
                  size: 20, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              width: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Center(child: Text(quantity.toString())),
              ),
            ),
            GestureDetector(
              onTap: onIcrement,
              child: Icon(Icons.add,
                  size: 20, color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ));
  }
}
