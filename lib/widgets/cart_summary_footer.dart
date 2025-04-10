import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class CartSummaryFooter extends StatelessWidget {
  final List<GroceryItem> items;

  const CartSummaryFooter({super.key, this.items = const []});

  @override
  Widget build(BuildContext context) {
    final listTotal = items.fold(0.0, (sum, i) => sum + i.price);
    final cartItems = items.where((i) => i.isInCart).length;
    final cartTotal = items
        .where((i) => i.isInCart)
        .fold(0.0, (sum, i) => sum + i.price);

    return SafeArea(
      child: Container(
        color: Colors.black,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart Total: ₹${cartTotal.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Items in cart: $cartItems',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'List Total: ₹${listTotal.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Items in list: ${items.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
