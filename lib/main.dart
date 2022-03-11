import 'package:contatos/database/app_database.dart';
import 'package:contatos/model/contact.dart';
import 'package:contatos/screens/contacts_list.dart';
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
  save(Contato(0,'Lucas', 100)).then((id){
    findAll().then((contatos) => debugPrint(contatos.toString()));
  });
}
