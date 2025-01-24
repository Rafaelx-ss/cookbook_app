import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'screens/home_screen.dart';
import 'screens/networking/networking_index.dart';


Future<void> main() async {
  // Asegúrate de inicializar Flutter correctamente
  WidgetsFlutterBinding.ensureInitialized();

  // Configura sqflite_common_ffi solo para entornos de escritorio
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
