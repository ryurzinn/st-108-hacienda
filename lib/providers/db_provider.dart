import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:st108/database/db_pesada.dart';
import 'package:st108/models/pesadas.dart';

class DBProvider { 

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async{
  if(_database != null ) return _database;

  _database = await initDB();

  return _database;

}

 Future<Database> initDB() async{
 // Path donde se almacena la base de datos
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  final path = join(documentsDirectory.path, 'PesadasDB.db');
  // Aca creo la base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: (Database db , int version) async{

      await db.execute(DBpesadas.tablePesadas);

      },
      onUpgrade: ((db, oldVersion, newVersion) {
        if(oldVersion < 2){
          
        }
      })
    );
  }

  Future<int?> insertPesada(DBpesadas dBpesadas) async{
    final db = await database;
    final resp = await db?.insert(DBpesadas.tableNamePesadas, dBpesadas.toMap());
    return resp;
  }

  Future<List<PesadasModel>> getPesadas()async{
    final db = await database;
    final resp = await db?.query(DBpesadas.tableNamePesadas);

    return resp!.isNotEmpty
      ? resp.map((e) => PesadasModel.fromMap(e)).toList()
      : [];

  }


}