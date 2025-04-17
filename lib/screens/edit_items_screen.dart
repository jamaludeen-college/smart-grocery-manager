import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import '../utils/item_category_helper.dart';

class NewOrEditItemScreen extends StatefulWidget {
  final GroceryItem? item; // If not null, editing
  final void Function(GroceryItem item) onSave;

  const NewOrEditItemScreen({super.key, this.item, required this.onSave});

  @override
  State<NewOrEditItemScreen> createState() => _NewOrEditItemScreenState();
}

class _NewOrEditItemScreenState extends State<NewOrEditItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _quantityController;
  late TextEditingController _priceController;
  late TextEditingController _noteController;
  String _unit = 'Piece';
  String _category = 'Uncategorized';
  bool _isInCart = false;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _nameController = TextEditingController(text: item?.name ?? '');
    _quantityController = TextEditingController(
      text: item?.quantity.toString() ?? '',
    );

    _priceController = TextEditingController(
      text: item?.price.toString() ?? '',
    );
    _noteController = TextEditingController(text: item?.note ?? '');
    _unit = item?.unit ?? 'Piece';
    _category = item?.category ?? 'Uncategorized';
    _isInCart = item?.isInCart ?? false;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final item = GroceryItem(
        id: widget.item?.id ?? UniqueKey().toString(),
        name: _nameController.text.trim(),
        quantity: int.tryParse(_quantityController.text.trim()) ?? 1,
        price: double.tryParse(_priceController.text) ?? 0.0,
        unit: _unit,
        note: _noteController.text.trim(),
        category: _category,
        isInCart: _isInCart,
      );
      widget.onSave(item); // This already pops the screen
      // Don't call Navigator.pop again here
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.item != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Item' : 'New Item'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _submit),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) => value!.isEmpty ? 'Enter name' : null,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _quantityController,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _unit,
                    items:
                        ['Piece', 'Kg', 'g', 'L', 'ml']
                            .map(
                              (u) => DropdownMenuItem(value: u, child: Text(u)),
                            )
                            .toList(),
                    onChanged: (val) => setState(() => _unit = val ?? 'Piece'),
                    decoration: const InputDecoration(labelText: 'Unit'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const Text("Place into cart"),
                    Checkbox(
                      value: _isInCart,
                      onChanged: (value) => setState(() => _isInCart = value!),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              items:
                  ItemCategoryHelper.categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged:
                  (value) =>
                      setState(() => _category = value ?? 'Uncategorized'),
            ),

            const SizedBox(height: 16),
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(labelText: 'Note'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            const Text("Photo (optional)", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey[300],
              child: const Icon(Icons.camera_alt, size: 40, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
