import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class GroceryFilter extends StatefulWidget {
  const GroceryFilter({super.key});

  @override
  State<GroceryFilter> createState() => _GroceryFilterState();
}

class _GroceryFilterState extends State<GroceryFilter> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchText = controller.text.toLowerCase();

    final filteredItems = dummyGroceryItems.where((item) {
      return item.name.toLowerCase().contains(searchText);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Search groceries',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (_) {
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: filteredItems.isEmpty
              ? const Center(child: Text('No matching groceries'))
              : ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) =>
                      GroceryTile(grocery: filteredItems[index]),
                ),
        ),
      ],
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
