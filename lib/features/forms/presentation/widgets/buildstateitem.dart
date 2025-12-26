import 'package:flutter/material.dart';

Widget buildStateItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? 'Empty' : value,
              style: TextStyle(
                color: value.isEmpty ? Colors.grey[500] : Colors.grey[700],
              ),
            ),
          ),
        ],
      )
    );
  }