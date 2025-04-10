import 'package:flutter/material.dart';
import 'package:smg/models/grocery_item.dart';
import 'package:smg/widgets/category_header.dart';
import 'package:smg/utils/item_category_helper.dart';

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
      children:
          groupedItems.entries.map((entry) {
            final category = entry.key;
            final categoryItems = entry.value;
            final categoryColor = ItemCategoryHelper.getCategoryColor(category);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryHeader(
                  title: category.toUpperCase(),
                  backgroundColor: categoryColor,
                ),
                ...categoryItems.map(
                  (item) => ListTile(
                    leading: Checkbox(
                      value: item.isInCart,
                      onChanged: (value) {
                        if (value != null) {
                          onItemChecked(item, value);
                        }
                      },
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                        decoration:
                            item.isInCart
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),

                    subtitle: Text(
                      '₹${item.price.toStringAsFixed(2)} • ${item.quantity}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => onEdit(item),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => onDelete(item),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}
