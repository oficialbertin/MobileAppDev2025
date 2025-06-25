import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int total;
  final int completed;

  ProgressBar({required this.total, required this.completed});

  @override
  Widget build(BuildContext context) {
    double percent = total == 0 ? 0 : completed / total;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          LinearProgressIndicator(value: percent),
          SizedBox(height: 8),
          Text('Completed: $completed / $total'),
        ],
      ),
    );
  }
} 