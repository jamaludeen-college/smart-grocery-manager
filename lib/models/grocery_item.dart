class GroceryItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final bool isChecked;
  final int quantity;
  final String? unit;
  final String? note;
  final bool isInCart;

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

  GroceryItem copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    bool? isChecked,
    int? quantity,
    String? unit,
    String? note,
    bool? isInCart,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      isChecked: isChecked ?? this.isChecked,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      note: note ?? this.note,
      isInCart: isInCart ?? this.isInCart,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryItem &&
          runtimeType == other.runtimeType &&
          name.toLowerCase() == other.name.toLowerCase();

  @override
  int get hashCode => name.toLowerCase().hashCode;
}
