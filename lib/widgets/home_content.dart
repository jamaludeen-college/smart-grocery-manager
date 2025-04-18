// widgets/home_content.dart
import 'package:flutter/material.dart';
import 'package:smg/widgets/custom_app_bar.dart';
import 'package:smg/widgets/grocery_list_view.dart';
import 'package:smg/widgets/cart_summary_footer.dart';
import 'package:smg/models/grocery_item.dart';

class HomeContent extends StatelessWidget {
  final List<GroceryItem> items;
  final Function(String) onSubmitted;
  final TextEditingController controller;
  final String selectedList;
  final List<String> listOptions;
  final void Function(String?) onListChanged;
  final VoidCallback onMicPressed;
  final bool isListening;
  final FocusNode focusNode;
  final Function(GroceryItem) onEdit;
  final Function(GroceryItem) onDelete;
  final Function(GroceryItem, bool) onItemChecked;

  const HomeContent({
    super.key,
    required this.items,
    required this.onSubmitted,
    required this.controller,
    required this.selectedList,
    required this.listOptions,
    required this.onListChanged,
    required this.onMicPressed,
    required this.isListening,
    required this.focusNode,
    required this.onEdit,
    required this.onDelete,
    required this.onItemChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          controller: controller,
          onSubmitted: onSubmitted,
          selectedList: selectedList,
          listOptions: listOptions,
          onListChanged: onListChanged,
          onMicPressed: onMicPressed,
          isListening: isListening,
          focusNode: focusNode,
        ),
        Expanded(
          child: GroceryListView(
            items: items,
            onEdit: onEdit,
            onDelete: onDelete,
            onItemChecked: onItemChecked,
          ),
        ),
        CartSummaryFooter(items: items),
      ],
    );
  }
}
