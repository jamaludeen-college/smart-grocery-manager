import 'package:flutter/material.dart';

class ItemCategoryHelper {
  static final Map<String, String> _categoryMap = {
    // Dairy
    'milk': 'Dairy',
    'butter': 'Dairy',
    'egg': 'Dairy',
    'cheese': 'Dairy',
    'yogurt': 'Dairy',

    // Produce
    'banana': 'Produce',
    'apple': 'Produce',
    'avocado': 'Produce',
    'kale': 'Produce',
    'carrot': 'Produce',
    'spinach': 'Produce',
    'dates': 'Produce',
    'mirchi': 'Produce',
    'onion': 'Produce',
    'tomato': 'Produce',
    'potato': 'Produce',
    'grapes': 'Produce',

    // Grains
    'bread': 'Grains',
    'rice': 'Grains',
    'oats': 'Grains',
    'pasta': 'Grains',
    'flour': 'Grains',
    'wheat': 'Grains',
    'cereal': 'Grains',

    // Meat
    'chicken': 'Meat',
    'beef': 'Meat',
    'mutton': 'Meat',
    'fish': 'Meat',

    // Snacks
    'chips': 'Snacks',
    'cookies': 'Snacks',
    'biscuits': 'Snacks',
    'namkeen': 'Snacks',
    'chocolate': 'Snacks',

    // Beverages
    'juice': 'Beverages',
    'soda': 'Beverages',
    'coffee': 'Beverages',
    'tea': 'Beverages',
    'milkshake': 'Beverages',

    // Spices
    'salt': 'Spices',
    'sugar': 'Spices',
    'pepper': 'Spices',
    'turmeric': 'Spices',
    'masala': 'Spices',
    'spices': 'Spices',

    // Personal Care
    'soap': 'Personal Care',
    'shampoo': 'Personal Care',
    'detergent': 'Personal Care',
    'toothpaste': 'Personal Care',
  };

  static String normalize(String name) {
    switch (name) {
      case 'eggs':
        return 'egg';
      case 'tomatoes':
        return 'tomato';
      case 'potatoes':
        return 'potato';
      case 'grape':
        return 'grapes';
      case 'mirchis':
        return 'mirchi';
      default:
        return name;
    }
  }

  static String getCategory(String itemName) {
    itemName = normalize(itemName.toLowerCase());
    return _categoryMap[itemName] ?? 'Uncategorized';
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

  static List<String> get categories {
    return [
      'Dairy',
      'Produce',
      'Grains',
      'Meat',
      'Snacks',
      'Beverages',
      'Spices',
      'Personal Care',
      'Uncategorized',
    ];
  }

}
