import 'package:app_encuestas/conteo/models/conteoModel.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class BD {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'conteo.db'),
        onCreate: (db, version) async {
      return db.execute(
        "CREATE TABLE conteo (id INTEGER PRIMARY KEY, parroquia TEXT,recinto TEXT,sector TEXT,genero TEXT,mesa INTEGER,cantidadIgnacioDavalos INTEGER,cantidadXavierVilca INTEGER,cantidadMyriamAuz INTEGER,cantidadCarlosOrtega INTEGER,cantidadFelioeBonilla INTEGER,cantidadSalomemarin INTEGER,cantidadDianaCaiza INTEGER,cantidadLuisAmoroso INTEGER,cantidadJavierAltamirano INTEGER,cantidadNulos Integer,cantidadBlancos INTEGER,cantidadTotal INTEGER,photo TEXT,imagePath TEXT,visible INTEGER)",
      );
    }, version: 1);
  }

  static Future<Future<int>> insert(conteoModel conteo) async {
    Database database = await _openDB();

    return database.insert("conteo", conteo.toMap());
  }

  static Future<Future<int>> delete(int id) async {
    Database database = await _openDB();
    return database.delete('conteo',where: 'id=?',whereArgs: [id]);
  }

  static Future<Future<int>> update(int id) async {
    Database database = await _openDB();
    return database.rawUpdate('UPDATE conteo SET visible = ? WHERE id=?',
    [0,id]);
  }

  static Future<dynamic> getconteo(int id) async {
    final database = await _openDB();

    final res = await database.query('conteo',where: 'id=?',whereArgs: [id]);
    return res;

   
  }
  static  Future<dynamic> getTodo() async {
    final database = await _openDB();

    final res = await database.query('conteo',where: 'visible=1');
    print("###########conteo@####");
    print(res);
    print(res.runtimeType);
    print(res);
    return res;

   
  }
}
