import 'package:app_encuestas/alcaldiadiciembre/models/encuestamodels.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class BDDiciembre {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'encuestadiciembre.db'),
        onCreate: (db, version) async {
      return db.execute(
        "CREATE TABLE encuestadiciembre (id INTEGER PRIMARY KEY,date TEXT,genero TEXT,parroquia TEXT,sector TEXT,edad TEXT, respuesta1 TEXT,respuesta2 TEXT,respuesta3 TEXT,respuesta4 TEXT,respuesta5 TEXT,respuesta6 TEXT,respuesta7 TEXT,respuesta8 TEXT,respuesta9 TEXT,respuesta10 TEXT,respuesta11 TEXT,respuesta12 TEXT,respuesta13 TEXT,respuesta14 TEXT,respuesta15 TEXT,respuesta16 TEXT,respuesta17 TEXT,respuesta18 TEXT,respuesta19 TEXT,respuesta20 TEXT,respuesta21 TEXT,latitud TEXT,longitud TEXT, user TEXT)",
      );
    }, version: 1);
  }

  static Future<Future<int>> insert(encuestaDiciembreModel encuestadiciembre) async {
    Database database = await _openDB();

    return database.insert("encuestadiciembre", encuestadiciembre.toMap());
  }

  static Future<Future<int>> delete() async {
    Database database = await _openDB();
    return database.delete('encuestadiciembre');
  }

  static Future<Future<int>> update(int id) async {
    Database database = await _openDB();
    return database.rawUpdate('UPDATE encuestadiciembre SET visible = ? WHERE id=?',
    [0,id]);
  }

  static Future<dynamic> getconteo(int id) async {
    final database = await _openDB();

    final res = await database.query('encuestadiciembre',where: 'id=?',whereArgs: [id]);
    return res;

   
  }
  static  Future<dynamic> getTodo() async {
    final database = await _openDB();

    final res = await database.query('encuestadiciembre');
    print("######bd diciembre encuenstas###");
    print(res);
    print(res.runtimeType);
    print(res);
    return res;

   
  }
}
