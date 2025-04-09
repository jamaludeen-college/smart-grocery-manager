class GroceryItem {
  final String name;
  final String category;
  final double price;
  bool isInCart;
  int quantity;

  GroceryItem({
    required this.name,
    required this.category,
    this.price = 0.0,
    this.isInCart = false,
    this.quantity = 1,
  });

  // Optional: if you're using isChecked in UI logic, alias it
  bool get isChecked => isInCart;
  set isChecked(bool value) => isInCart = value;
}
