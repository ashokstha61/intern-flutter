import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildTaskCard(
  BuildContext context, {
  required int day,
  required String title,
  required String description,
  required bool completed,
  required IconData icon,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: completed
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          icon,
          color: completed ? Theme.of(context).primaryColor : Colors.grey[600],
        ),
      ),
      title: Text(
        'Day $day: $title',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: completed ? Colors.grey[600] : null,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(color: completed ? Colors.grey[500] : null),
      ),
      trailing: completed
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                FontAwesomeIcons.check,
                size: 16,
                color: Colors.green,
              ),
            )
          : Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withAlpha(1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                FontAwesomeIcons.clock,
                size: 16,
                color: Colors.orange,
              ),
            ),
      onTap: () {
        switch (day) {
          case 2:
            Beamer.of(context).beamToNamed('/counter');
            break;
          case 3:
            Beamer.of(context).beamToNamed('/api-demo');
            break;
          case 4:
          case 5:
            Beamer.of(context).beamToNamed('/list');
            break;
          case 6:
            Beamer.of(context).beamToNamed('/add-item');
            break;
        }
      },
    ),
  );
}
