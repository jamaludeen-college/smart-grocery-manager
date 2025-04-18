import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class GroceryItemTile extends StatefulWidget {
  final GroceryItem item;
  final ValueChanged<bool> onChanged;
  final void Function(GroceryItem)? onEdit;
  final void Function(GroceryItem)? onDelete;

  const GroceryItemTile({
    super.key,
    required this.item,
    required this.onChanged,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<GroceryItemTile> createState() => _GroceryItemTileState();
}

class _GroceryItemTileState extends State<GroceryItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
      ), // Tighter horizontal padding
      dense: true, // Reduces vertical height
      onLongPress: () => widget.onEdit?.call(widget.item),
      leading: Checkbox(
        value: widget.item.isChecked,
        onChanged: (value) {
          widget.onChanged(value ?? false);
        },
        activeColor: Colors.teal,
      ),
      title: Text(
        widget.item.name,
        style: TextStyle(
          decoration: widget.item.isChecked ? TextDecoration.lineThrough : null,
          color: widget.item.isChecked ? Colors.grey : Colors.black,
          fontStyle: widget.item.isChecked ? FontStyle.italic : null,
        ),
      ),
      subtitle: Text(
        '₹${widget.item.price.toStringAsFixed(2)} • ${widget.item.quantity}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () => widget.onDelete?.call(widget.item),
      ),
    );
  }
}
