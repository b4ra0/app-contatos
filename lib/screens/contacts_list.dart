import 'package:contatos/database/dao/contact_dao.dart';
import 'package:contatos/model/contact.dart';
import 'package:contatos/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  List<Contato> contatos = [];
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              contatos = snapshot.data as List<Contato>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return ItemContato(contato);
                },
                itemCount: contatos.length,
              );
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text("Loading")],
                ),
              );
          }
          return Text("Olá");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioContato(),
            ),
          ).then((value) => setState((){}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemContato extends StatelessWidget {
  late final Contato contato;

  ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contato.nome),
        subtitle: Text(contato.numeroConta.toString()),
      ),
    );
  }
}
