import 'package:contatos/model/contact.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  FormularioContato({Key? key}) : super(key: key);

  @override
  State<FormularioContato> createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome"),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: "Número da conta"),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 24),
            ),
            Padding(padding: EdgeInsets.all(5)),
            TextButton(
              onPressed: () {
                final String nome = _nomeController.text;
                final int numero = int.parse(_numeroController.text);
                final Contato novoContato = Contato(0, nome,numero);
                Navigator.pop(context, novoContato);
              },
              child: Text("Adicionar"),
            ),
          ],
        ),
      ),
    );
  }
}
