import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_list_tile.dart';
import 'package:food_delivery_app/models/restaraunt.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaraunt>(builder: (context, restaraunt, child) {
      final userCart = restaraunt.cart;

      return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'Are you sure you want to clear all the cart?',
                                style: TextStyle(fontSize: 16)),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    restaraunt.clearCart();
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete)),
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(child: Text('Cart is empty...')))
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  final cartItem = userCart[index];

                                  return MyListTile(cartItem: cartItem);
                                }),
                          )
                  ],
                ),
              ),
              MyButton(
                  buttonText: "Go to checkout",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentPage()));
                  }),
              const SizedBox(
                height: 20,
              )
            ],
          ));
    });
  }
}
