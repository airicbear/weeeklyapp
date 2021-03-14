import 'package:flutter/material.dart';

class MissingLyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Sorry, no lyrics available yet!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Vollkorn',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).disabledColor,
        ),
      ),
    );
  }
}
