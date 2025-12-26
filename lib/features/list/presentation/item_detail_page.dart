import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final int itemId;

  const ItemDetailPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item $itemId Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Item $itemId',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('This is the detailed view of the item.'),
          ],
        ),
      ),
    );
  }
}