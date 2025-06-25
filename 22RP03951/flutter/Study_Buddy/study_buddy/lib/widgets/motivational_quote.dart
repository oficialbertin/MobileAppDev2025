import 'package:flutter/material.dart';
import 'dart:math';

class MotivationalQuote extends StatelessWidget {
  final List<String> quotes = [
    'Success is the sum of small efforts, repeated day in and day out.',
    'The secret of getting ahead is getting started.',
    'Don\'t watch the clock; do what it does. Keep going.',
    'Believe you can and you\'re halfway there.',
    'Push yourself, because no one else is going to do it for you.',
    'Great things never come from comfort zones.',
    'Dream it. Wish it. Do it.',
    'Stay positive, work hard, make it happen.',
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final quote = quotes[random.nextInt(quotes.length)];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            quote,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
} 