import 'package:flutter/material.dart';
import 'package:smg/models/grocery_item.dart';
import 'package:smg/widgets/custom_app_bar.dart';
import 'package:smg/widgets/category_header.dart';
import 'package:smg/widgets/grocery_item_tile.dart';
import 'package:smg/widgets/cart_summary_footer.dart';
import 'package:smg/data/grocery_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _itemController = TextEditingController();
  final List<GroceryItem> _items = List.from(groceryItems); // mutable list

  void _addItem(String name) {
    if (name.trim().isEmpty) return;

    String lower = name.toLowerCase();
    String category = 'Uncategorized';

    if (['butter', 'milk', 'eggs', 'yogurt'].contains(lower)) {
      category = 'Dairy';
    } else if ([
      'dates',
      'kale',
      'mirchi',
      'bananas',
      'avocados',
    ].contains(lower)) {
      category = 'Produce';
    }

    setState(() {
      _items.add(GroceryItem(name: name, category: category));
      _itemController.clear();
    });
  }

  List<String?> getCategories() {
    return _items.map((e) => e.category).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(controller: _itemController, onSubmitted: _addItem),
        Expanded(
          child: ListView(
            children:
                getCategories().map((category) {
                  final itemsInCategory =
                      _items.where((i) => i.category == category).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryHeader(title: category!.toUpperCase()),
                      ...itemsInCategory.map((item) {
                        return GroceryItemTile(
                          item: item,
                          onChanged: (val) {
                            setState(() {
                              item.isInCart = val!;
                            });
                          },
                        );
                      }),
                    ],
                  );
                }).toList(),
          ),
        ),
        CartSummaryFooter(items: _items),
      ],
    );
  }
}
