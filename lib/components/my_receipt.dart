import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaraunt.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Thank you for your order!"),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaraunt>(
                  builder: (context, restaraunt, child) =>
                      Text(restaraunt.displayCartReceipt())),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text("Estimated delivery time is 4:10pm")
        ],
      ),
    );
  }
}
