import 'package:contatos/model/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{

  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'contatosbanco.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE contatos('
                'id INTEGER PRIMARY KEY,'
                'nome TEXT, '
                'numeroConta INTEGER) ');
          }, version: 1,
  );
}

Future<int> save(Contato contato) async{
  final Database db = await getDatabase();
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['nome'] = contato.nome;
    contatoMap['numeroConta'] = contato.numeroConta;
    return db.insert('contatos', contatoMap);
}

Future<List<Contato>> findAll() async{
  final Database db = await getDatabase();
  final List<Map<String,dynamic>> result = await db.query("contatos");
      final List<Contato> contatos = [];
      for (Map<String, dynamic> map in result) {
        final Contato contato = Contato(
          map['id'],
          map['nome'],
          map['numeroConta'],
        );
        contatos.add(contato);
      }
      return contatos;
}
