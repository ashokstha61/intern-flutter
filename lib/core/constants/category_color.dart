import 'package:flutter/material.dart';

Color getCategoryColor(String category) {
  final colors = {
    'Electronics': Colors.blue,
    'Clothing': Colors.purple,
    'Books': Colors.orange,
    'Home & Garden': Colors.green,
    'Sports': Colors.red,
    'Toys': Colors.pink,
    'General': Colors.grey,
    'Other': Colors.teal,
  };

  return colors[category] ?? Colors.blue;
}
