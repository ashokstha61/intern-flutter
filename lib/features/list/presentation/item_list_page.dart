import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ItemsListPage extends StatelessWidget {
  final List<String> items = List.generate(20, (i) => 'Item ${i + 1}');

  ItemsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Beamer.of(context).beamBack(),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.list)),
            title: Text(items[index]),
            subtitle: Text('Description for ${items[index]}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.beamToNamed('/list/${index + 1}');
            },
          );
        },
      ),
    );
  }
}
