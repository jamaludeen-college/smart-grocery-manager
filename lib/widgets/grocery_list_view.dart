import 'package:flutter/material.dart';
import 'package:smg/models/grocery_item.dart';
import 'package:smg/widgets/category_header.dart';
import 'package:smg/utils/item_category_helper.dart';
import 'package:smg/widgets/grocery_item_tile.dart';

class GroceryListView extends StatelessWidget {
  final List<GroceryItem> items;
  final void Function(GroceryItem) onEdit;
  final void Function(GroceryItem) onDelete;
  final void Function(GroceryItem, bool) onItemChecked;

  const GroceryListView({
    super.key,
    required this.items,
    required this.onEdit,
    required this.onDelete,
    required this.onItemChecked,
  });

  @override
  Widget build(BuildContext context) {
    // Group items by category
    final Map<String, List<GroceryItem>> groupedItems = {};

    for (final item in items) {
      final category = item.category;
      groupedItems.putIfAbsent(category, () => []).add(item);
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      children:
          groupedItems.entries.map((entry) {
            final category = entry.key;
            final categoryItems = entry.value;

            // ✅ Sort: unchecked first, then checked
            categoryItems.sort((a, b) {
              if (a.isChecked == b.isChecked) return 0;
              return a.isChecked ? 1 : -1; // unchecked first
            });

            final categoryColor = ItemCategoryHelper.getCategoryColor(category);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                CategoryHeader(
                  title: category.toUpperCase(),
                  backgroundColor: categoryColor,
                ),
                const SizedBox(height: 4),
                ...categoryItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GroceryItemTile(
                      item: item,
                      onChanged: (checked) => onItemChecked(item, checked),
                      onEdit: onEdit,
                      onDelete: onDelete,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }

}
