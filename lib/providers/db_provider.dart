import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:st108/database/db_maximo.dart';
import 'package:st108/database/db_pesada.dart';
import 'package:st108/models/maximo_peso_model.dart';
import 'package:st108/models/pesadas_model.dart';

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
      await db.execute(DBPesadasMaximo.tablePesadasMaximo);

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

   Future<int?> deletePesada(int id) async{
    final db = await database;
    final resp = await db?.delete(DBpesadas.tableNamePesadas, where: 'id=?', whereArgs: [id]);
    return resp;
  }

  Future<int?> insertarMaximo(DBPesadasMaximo maximo) async{
      final db = await  database;
      final resp = await db!.insert(DBPesadasMaximo.tableNamePesadasMaximo, maximo.toMap());
      
      return resp;
  }
  Future<int?> actualizarMaximo(DBPesadasMaximo maximo) async{
    final db = await  database;
    final resp = await db!.update(DBPesadasMaximo.tableNamePesadasMaximo, maximo.toMap(), where: 'id=?', whereArgs: [1]);

    return resp;
  }
  Future<List<PesoMaximoModel>> buscarMaximo()async{
    final db = await database;
    final resp = await db?.query(DBPesadasMaximo.tableNamePesadasMaximo);

    return resp!.isNotEmpty
      ? resp.map((e) => PesoMaximoModel.fromMap(e)).toList()
      : [];

  }

}