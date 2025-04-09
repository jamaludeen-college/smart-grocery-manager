import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String title;

  const CategoryHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color:
          title.toUpperCase() == 'PRODUCE'
              ? Colors.green.shade100
              : Colors.grey.shade300,
      width: double.infinity,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color:
              title.toUpperCase() == 'PRODUCE'
                  ? Colors.green.shade800
                  : Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
