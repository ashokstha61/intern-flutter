import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:beamer/beamer.dart';
import 'package:projectintern/core/utils/form_actions.dart';
import 'package:projectintern/features/forms/presentation/widgets/buildFormField.dart';
import 'package:projectintern/features/forms/presentation/widgets/buildcategorydropdown.dart';
import 'package:projectintern/features/forms/presentation/widgets/buildstateitem.dart';
import 'package:projectintern/provider/item_provider.dart';
import '../../../core/widgets/custom_button.dart';
import '../state/form_provider.dart';

class AddItemFormPage extends ConsumerWidget {
  const AddItemFormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(addItemFormProvider);
    final formNotifier = ref.read(addItemFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Beamer.of(context).beamBack(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.plusCircle,
                      size: 60,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Add New Item',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fill in the details below to add a new item',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            buildFormField(
              context,
              label: 'Title',
              hint: 'Enter item title',
              icon: FontAwesomeIcons.heading,
              error: formState.fieldErrors['title'],
              onChanged: formNotifier.updateTitle,
            ),
            const SizedBox(height: 20),
            buildFormField(
              context,
              label: 'Description',
              hint: 'Enter item description',
              icon: FontAwesomeIcons.alignLeft,
              error: formState.fieldErrors['description'],
              maxLines: 4,
              onChanged: formNotifier.updateDescription,
            ),
            const SizedBox(height: 20),
            buildFormField(
              context,
              label: 'Price',
              hint: 'Enter price (e.g., 29.99)',
              icon: FontAwesomeIcons.dollarSign,
              error: formState.fieldErrors['price'],
              keyboardType: TextInputType.number,
              onChanged: formNotifier.updatePrice,
            ),
            const SizedBox(height: 20),
            buildCategoryDropdown(context, formState.category, formNotifier),
            if (formState.error != null) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red),
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.circleExclamation,
                      color: Colors.red[400],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        formState.error!,
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 30),
            CustomButton(
              text: 'Submit Item',
              onPressed: () => submitForm(context, ref),
              isLoading: formState.isLoading,
              icon: FontAwesomeIcons.paperPlane,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: formNotifier.reset,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.redo, size: 20),
                  SizedBox(width: 8),
                  Text('Reset Form'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Form State',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    buildStateItem('Title', formState.title),
                    buildStateItem('Description', formState.description),
                    buildStateItem(
                      'Price',
                      '\$${formState.price.toStringAsFixed(2)}',
                    ),
                    buildStateItem('Category', formState.category),
                    buildStateItem('Is Valid', formState.isValid.toString()),
                    buildStateItem('Errors', '${formState.fieldErrors.length}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
