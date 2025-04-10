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
      leading: Checkbox(
        value: widget.item.isChecked,
        onChanged: (value) => widget.onChanged(value ?? false),
        activeColor: Colors.teal,
      ),
      title: Text(
        widget.item.name,
        style: TextStyle(
          decoration:
              widget.item.isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
          color: widget.item.isChecked ? Colors.grey : Colors.black,
          fontStyle:
              widget.item.isChecked ? FontStyle.italic : FontStyle.normal,
        ),
      ),

      subtitle: Text(
        // ignore: unnecessary_null_comparison
        '₹${widget.item.price.toStringAsFixed(2)}${widget.item.quantity != null ? ' • ${widget.item.quantity}' : ''}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () => widget.onEdit?.call(widget.item),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => widget.onDelete?.call(widget.item),
          ),
        ],
      ),
    );
  }
}
