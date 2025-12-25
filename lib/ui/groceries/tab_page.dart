import 'package:flutter/material.dart';
import 'package:week13_quiz/data/mock_grocery_repository.dart';
import 'package:week13_quiz/models/grocery.dart';
import 'package:week13_quiz/ui/groceries/grocery_filter.dart';
import 'package:week13_quiz/ui/groceries/grocery_form.dart';
import 'package:week13_quiz/ui/groceries/grocery_list.dart';


class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int selectedIndex = 0;

  void onCreate() async {
    Grocery? newGrocery = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(builder: (_) => const GroceryForm()),
    );

    if (newGrocery != null) {
      setState(() {
        dummyGroceryItems.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = const [
      GroceryList(),
      GroceryFilter(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: onCreate, icon: const Icon(Icons.add)),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Filter',
          ),
        ],
      ),
    );
  }
}
