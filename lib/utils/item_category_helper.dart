import 'package:flutter/material.dart';

class ItemCategoryHelper {
  static final Map<String, String> _categoryMap = {
    // Dairy
    'milk': 'Dairy',
    'butter': 'Dairy',
    'egg': 'Dairy',
    'cheese': 'Dairy',
    'yogurt': 'Dairy',
    'paneer': 'Dairy',
    'curd': 'Dairy',
    'ghee': 'Dairy',

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
    'cucumber': 'Produce',
    'lemon': 'Produce',
    'mango': 'Produce',
    'orange': 'Produce',
    'beetroot': 'Produce',
    'garlic': 'Produce',
    'ginger': 'Produce',

    // Grains
    'bread': 'Grains',
    'rice': 'Grains',
    'oats': 'Grains',
    'pasta': 'Grains',
    'flour': 'Grains',
    'wheat': 'Grains',
    'cereal': 'Grains',
    'noodles': 'Grains',
    'cornflakes': 'Grains',
    'semolina': 'Grains',
    'barley': 'Grains',

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
    'popcorn': 'Snacks',
    'samosa': 'Snacks',
    'nachos': 'Snacks',

    // Beverages
    'juice': 'Beverages',
    'soda': 'Beverages',
    'coffee': 'Beverages',
    'tea': 'Beverages',
    'milkshake': 'Beverages',
    'lassi': 'Beverages',
    'smoothie': 'Beverages',
    'energy drink': 'Beverages',

    // Spices
    'salt': 'Spices',
    'sugar': 'Spices',
    'pepper': 'Spices',
    'turmeric': 'Spices',
    'masala': 'Spices',
    'spices': 'Spices',
    'cumin': 'Spices',
    'coriander': 'Spices',
    'chilli powder': 'Spices',
    'mustard seeds': 'Spices',
    'asafoetida': 'Spices',

    // Personal Care
    'soap': 'Personal Care',
    'shampoo': 'Personal Care',
    'detergent': 'Personal Care',
    'toothpaste': 'Personal Care',
    'toothbrush': 'Personal Care',
    'lotion': 'Personal Care',
    'face wash': 'Personal Care',
    'sanitizer': 'Personal Care',
    'razor': 'Personal Care',
    'tissue': 'Personal Care',
  };

  static String normalize(String name) {
    name = name.toLowerCase().trim();

    // Remove plural suffixes
    if (name.endsWith('es') &&
        _categoryMap.containsKey(name.substring(0, name.length - 2))) {
      return name.substring(0, name.length - 2);
    }
    if (name.endsWith('s') &&
        _categoryMap.containsKey(name.substring(0, name.length - 1))) {
      return name.substring(0, name.length - 1);
    }

    // Manual edge cases
    switch (name) {
      case 'grape':
        return 'grapes';
      case 'mirchis':
        return 'mirchi';
      case 'curds':
        return 'curd';
      default:
        return name;
    }
  }

  static String getCategory(String itemName) {
    itemName = normalize(itemName.toLowerCase());
    return _categoryMap[itemName] ?? 'Uncategorized';
  }

  static List<String> get categories =>
      _categoryMap.values.toSet().toList()..sort(); // Optional sorting

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
