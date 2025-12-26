import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectintern/features/forms/state/form_provider.dart';
import 'package:projectintern/provider/item_provider.dart';

void showDeleteDialog({
  required BuildContext context,
  required WidgetRef ref,
  required Item item,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Item'),
      content: Text('Are you sure you want to delete "${item.title}"?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            ref.read(itemsProvider.notifier).deleteItem(item.id);
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('"${item.title}" deleted'),
                backgroundColor: Colors.red,
              ),
            );
          },
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}
