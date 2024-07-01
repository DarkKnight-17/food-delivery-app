import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaraunt.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatelessWidget {
  final CartItem cartItem;

  const MyListTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaraunt>(
      builder: (context, restaraunt, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(cartItem.food.name),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('\$${cartItem.food.price.toString()}'),
                    ],
                  ),
                  const Spacer(),
                  QuantitySelector(
                      food: cartItem.food,
                      onDecrement: () {
                        restaraunt.removeFromCart(cartItem);
                      },
                      onIcrement: () {
                        restaraunt.addToCart(
                            cartItem.food, cartItem.selectedAddons);
                      },
                      quantity: cartItem.quantity)
                ],
              ),
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedAddons.map((addon) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                          label: Row(
                            children: <Widget>[
                              Text(addon.name),
                              const SizedBox(
                                width: 3,
                              ),
                              Text('\$${addon.price.toString()}')
                            ],
                          ),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12),
                          onSelected: (value) {}),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
