import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectintern/features/forms/state/form_provider.dart';
import 'package:projectintern/provider/item_provider.dart';

Future<void> submitForm(BuildContext context, WidgetRef ref) async {
    final formNotifier = ref.read(addItemFormProvider.notifier);
    final itemsNotifier = ref.read(itemsProvider.notifier);
    
    final item = await formNotifier.submit();
    if (item != null) {
      itemsNotifier.addItem(item);
      _showSuccessDialog(context, item);
    }
  }

  

  

  

  void _showSuccessDialog(BuildContext context, item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(FontAwesomeIcons.checkCircle, color: Colors.green),
            SizedBox(width: 12),
            Text('Success!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item "${item.title}" has been added successfully!',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Category: ${item.category}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Add Another'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Beamer.of(context).beamToNamed('/list'); // Navigate to list page
            },
            child: const Text('View All Items'),
          ),
        ],
      ),
    );
  }