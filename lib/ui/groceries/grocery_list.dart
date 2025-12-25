import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    if (dummyGroceryItems.isEmpty) {
      return const Center(child: Text('No items added yet.'));
    }

    return ListView.builder(
      itemCount: dummyGroceryItems.length,
      itemBuilder: (context, index) =>
          GroceryTile(grocery: dummyGroceryItems[index]),
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        color: grocery.category.color,
      ),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
