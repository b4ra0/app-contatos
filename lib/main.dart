import 'package:contatos/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Dashboard(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.yellow,
        ),
      ),
    ),
  );
}
