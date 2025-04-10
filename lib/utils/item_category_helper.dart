import 'package:flutter/material.dart';

class ItemCategoryHelper {
  static String getCategory(String itemName) {
    itemName = itemName.toLowerCase();

    if (['milk', 'butter', 'eggs', 'yogurt', 'cheese'].contains(itemName)) {
      return 'Dairy';
    } else if ([
      'banana',
      'apple',
      'avocado',
      'kale',
      'carrot',
      'spinach',
      'dates',
      'mirchi',
      'onion',
      'tomato',
      'grapes',
      'potato',
    ].contains(itemName)) {
      return 'Produce';
    } else if ([
      'bread',
      'rice',
      'oats',
      'pasta',
      'flour',
      'wheat',
      'cereal',
    ].contains(itemName)) {
      return 'Grains';
    } else if ([
      'chicken',
      'beef',
      'mutton',
      'fish',
      'egg',
    ].contains(itemName)) {
      return 'Meat';
    } else if ([
      'chips',
      'cookies',
      'biscuits',
      'namkeen',
      'chocolate',
    ].contains(itemName)) {
      return 'Snacks';
    } else if ([
      'juice',
      'soda',
      'coffee',
      'tea',
      'milkshake',
    ].contains(itemName)) {
      return 'Beverages';
    } else if ([
      'salt',
      'sugar',
      'pepper',
      'turmeric',
      'masala',
      'spices',
    ].contains(itemName)) {
      return 'Spices';
    } else if ([
      'soap',
      'shampoo',
      'detergent',
      'toothpaste',
    ].contains(itemName)) {
      return 'Personal Care';
    } else {
      return 'Uncategorized';
    }
  }

  static Color getCategoryColor(String category) {
    switch (category) {
      case 'Dairy':
        return Colors.lightBlue.shade400;
      case 'Produce':
        return Colors.green.shade600;
      case 'Grains':
        return Colors.brown.shade400;
      case 'Meat':
        return Colors.red.shade400;
      case 'Snacks':
        return Colors.orange.shade500;
      case 'Beverages':
        return Colors.teal.shade400;
      case 'Spices':
        return Colors.deepOrange.shade300;
      case 'Personal Care':
        return Colors.purple.shade400;
      case 'Uncategorized':
      default:
        return Colors.grey.shade600;
    }
  }
}
