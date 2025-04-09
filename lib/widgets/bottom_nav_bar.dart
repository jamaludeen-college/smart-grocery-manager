import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Pantry'),
        BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'To-do'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: (index) {
        // Navigation logic can be implemented here
      },
    );
  }
}
