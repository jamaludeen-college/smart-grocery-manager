class GroceryItem {
  String name;
  final String id; // <-- add this
  String category;
  double price;
  bool isChecked;
  int quantity;
  final String? unit; // <-- optional
  final String? note; // <-- optional
  bool isInCart;

  GroceryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.isChecked = false,
    this.quantity = 1,
    this.unit,
    this.note,
    this.isInCart = false,
  });

  // Override == and hashCode to prevent duplicates by name
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryItem &&
          runtimeType == other.runtimeType &&
          name.toLowerCase() == other.name.toLowerCase();

  @override
  int get hashCode => name.toLowerCase().hashCode;
}
