import 'package:contatos/database/app_database.dart';
import 'package:contatos/model/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {

  static final String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY,'
      '$_nome TEXT, '
      '$_numeroConta INTEGER) ';

  static const String _tableName = "contatos";
  static const String _id = 'id';
  static const String _nome = "nome";
  static const String _numeroConta = "numeroConta";

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_tableName, contatoMap);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_nome] = contato.nome;
    contatoMap[_numeroConta] = contato.numeroConta;
    return contatoMap;
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contato> contatos = _toList(result);
    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
    final List<Contato> contatos = [];
    for (Map<String, dynamic> map in result) {
      final Contato contato = Contato(
        map[_id],
        map[_nome],
        map[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}