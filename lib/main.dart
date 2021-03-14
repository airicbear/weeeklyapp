import 'package:flutter/material.dart';
import 'package:weeeklyapp/widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weeekly',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.deepOrange,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
