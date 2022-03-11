import 'package:flutter/material.dart';

class FormularioContato extends StatelessWidget {
  const FormularioContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Nome"
            ),
            style: TextStyle(
              fontSize: 24
            ),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Número da conta"
            ),
            style: TextStyle(
                fontSize: 24
            ),
          ),
        ],
      ),
    );
  }
}
