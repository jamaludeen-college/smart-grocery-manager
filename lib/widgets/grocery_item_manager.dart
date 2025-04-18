// utils/grocery_item_manager.dart
import 'package:flutter/material.dart';
import 'package:smg/models/grocery_item.dart';
import 'package:smg/utils/item_category_helper.dart';

class GroceryItemManager {
  final Map<String, List<GroceryItem>> _itemsByList;

  GroceryItemManager(this._itemsByList);

  void addItem({
    required BuildContext context,
    required String selectedList,
    required String name,
    required TextEditingController controller,
  }) {
    if (name.trim().isEmpty) return;

    final lower = name.toLowerCase();
    final selectedItems = _itemsByList[selectedList]!;
    final isDuplicate = selectedItems.any(
      (item) => item.name.toLowerCase() == lower,
    );

    if (isDuplicate) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Item "$name" already exists!')));
      controller.clear();
      return;
    }

    selectedItems.add(
      GroceryItem(
        id: UniqueKey().toString(),
        name: name,
        category: ItemCategoryHelper.getCategory(name),
        price: 10.0,
      ),
    );
    controller.clear();
  }

  void deleteItem(String selectedList, GroceryItem item) {
    _itemsByList[selectedList]?.remove(item);
  }

  List<GroceryItem> getItems(String selectedList) {
    return _itemsByList[selectedList] ?? [];
  }
}
