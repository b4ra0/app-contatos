import 'package:contatos/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{

  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'contatosbanco.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContatoDao.tableSql);
          }, version: 1,
  );
}