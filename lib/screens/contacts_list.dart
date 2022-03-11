import 'package:contatos/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Alex"),
              subtitle: Text("1234"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FormularioContato()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
