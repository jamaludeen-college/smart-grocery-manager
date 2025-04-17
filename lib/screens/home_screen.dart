// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:smg/screens/edit_items_screen.dart';
import 'package:smg/utils/item_category_helper.dart';
import 'package:smg/widgets/custom_app_bar.dart';
import 'package:smg/widgets/grocery_list_view.dart';
import 'package:smg/widgets/cart_summary_footer.dart';
import 'package:smg/models/grocery_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _itemController = TextEditingController();
  final List<String> listOptions = [
    'Grocery List',
    'Fruits',
    'Vegetables',
    'Snacks',
    'Dairy',
    'Beverages',
  ];

  String selectedList = 'Grocery List';

  final Map<String, List<GroceryItem>> _itemsByList = {
    'Grocery List': [],
    'Fruits': [],
    'Vegetables': [],
    'Snacks': [],
    'Dairy': [],
    'Beverages': [],
  };

  void _onListChanged(String? newList) {
    if (newList != null) {
      setState(() {
        selectedList = newList;
      });
    }
  }

  void _addItem(String name) {
    if (name.trim().isEmpty) return;

    final lower = name.toLowerCase();
    final defaultPrice = 10.0;

    final selectedItems = _itemsByList[selectedList]!;

    final isDuplicate = selectedItems.any(
      (item) => item.name.toLowerCase() == lower,
    );

    if (isDuplicate) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item "$name" already exists in "$selectedList"!'),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 2),
        ),
      );
      _itemController.clear();
      return;
    }

    setState(() {
      selectedItems.add(
        GroceryItem(
          id: UniqueKey().toString(),
          name: name,
          category: ItemCategoryHelper.getCategory(name),
          price: defaultPrice,
        ),
      );

      _itemController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$name" added to "$selectedList"!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _editItem(GroceryItem item) async {
    final updatedItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder:
            (context) => NewOrEditItemScreen(
              item: item,
              onSave: (newItem) => Navigator.pop(context, newItem),
            ),
      ),
    );

    if (!mounted) return;

    if (updatedItem != null) {
      setState(() {
        final selectedItems = _itemsByList[selectedList]!;
        final index = selectedItems.indexWhere((i) => i.id == updatedItem.id);
        if (index != -1) {
          selectedItems[index] = updatedItem;
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${updatedItem.name}" updated!'),
          backgroundColor: Colors.blue,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _deleteItem(GroceryItem item) {
    setState(() {
      _itemsByList[selectedList]!.remove(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${item.name}" deleted from "$selectedList".'),
        backgroundColor: Colors.grey[800],
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _itemsByList[selectedList]!;
    final List<GroceryItem> filteredItems = List.from(items);

    return Column(
      children: [
        CustomAppBar(
          controller: _itemController,
          onSubmitted: _addItem,
          selectedList: selectedList,
          listOptions: listOptions,
          onListChanged: _onListChanged,
        ),
        Expanded(
          child: GroceryListView(
            items: filteredItems,
            onEdit: _editItem,
            onDelete: _deleteItem,
            onItemChecked: (item, value) {
              final selectedItems = _itemsByList[selectedList]!;
              final index = selectedItems.indexWhere((i) => i.id == item.id);
              if (index != -1) {
                setState(() {
                  selectedItems[index] = item.copyWith(isChecked: value);
                });
              }
            },

          ),
        ),

        CartSummaryFooter(items: items),
      ],
    );
  }
}
