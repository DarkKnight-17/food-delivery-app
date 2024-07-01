import 'package:flutter/material.dart';

class MyCurrentDescriptionBox extends StatelessWidget {
  const MyCurrentDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                '\$0.99',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              Text('Delivery fee',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary)),
            ],
          ),
          Column(
            children: <Widget>[
              Text('15-30 min',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              Text('Delivery time',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary))
            ],
          )
        ],
      ),
    );
  }
}
