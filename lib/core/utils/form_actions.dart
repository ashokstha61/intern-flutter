import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectintern/core/utils/showsuccessdialog.dart';
import 'package:projectintern/features/forms/state/form_provider.dart';
import 'package:projectintern/provider/item_provider.dart';

Future<void> submitForm(BuildContext context, WidgetRef ref) async {
  final formNotifier = ref.read(addItemFormProvider.notifier);
  final itemsNotifier = ref.read(itemsProvider.notifier);

  final item = await formNotifier.submit();
  if (item != null) {
    itemsNotifier.addItem(item);
    showSuccessDialog(context, item);
  }
}
