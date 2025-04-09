import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class GroceryItemTile extends StatefulWidget {
  final GroceryItem item;

  const GroceryItemTile({
    super.key,
    required this.item,
    required Null Function(dynamic val) onChanged,
  });

  @override
  State<GroceryItemTile> createState() => _GroceryItemTileState();
}

class _GroceryItemTileState extends State<GroceryItemTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.item.name,
        style: TextStyle(
          decoration:
              widget.item.isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
        ),
      ),
      subtitle:
          // ignore: unnecessary_null_comparison
          widget.item.price != null
              ? Text(
                // ignore: unnecessary_null_comparison
                '₹${widget.item.price.toStringAsFixed(2)}${widget.item.quantity != null ? ' • ${widget.item.quantity}' : ''}',
              )
              : null,
      value: widget.item.isChecked,
      onChanged: (value) {
        setState(() {
          widget.item.isChecked = value ?? false;
        });
      },
      activeColor: Colors.teal,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
