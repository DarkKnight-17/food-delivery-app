import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyTapBar extends StatelessWidget {
  final TabController? tabController;
  const MyTapBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((e) {
      return Tab(
        text: e.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(controller: tabController, tabs: _buildCategoryTabs());
  }
}
