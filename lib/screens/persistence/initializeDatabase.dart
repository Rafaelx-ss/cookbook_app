import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

// Clase para inicializar la base de datos
class DatabaseInitializer {
  static Future<dynamic> initialize() async {
    if (kIsWeb) {
      // Para web, usa Sembast
      final factory = databaseFactoryWeb;
      return await factory.openDatabase('sembast_web.db');
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      // Para escritorio, usa SQLite con FFI
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      return await openDatabase(
        join(await getDatabasesPath(), 'doggie_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
          );
        },
        version: 1,
      );
    } else {
      // Para Android/iOS, usa SQLite
      return await openDatabase(
        join(await getDatabasesPath(), 'doggie_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
          );
        },
        version: 1,
      );
    }
  }
}
