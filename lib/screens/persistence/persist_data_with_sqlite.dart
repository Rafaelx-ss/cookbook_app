import 'package:flutter/material.dart';
import 'initializeDatabase.dart';
import 'package:sembast/sembast.dart'; // Para Sembast

class PersistDataWithSQLitePage extends StatefulWidget {
  const PersistDataWithSQLitePage({super.key});

  @override
  State<PersistDataWithSQLitePage> createState() =>
      _PersistDataWithSQLitePageState();
}

class _PersistDataWithSQLitePageState extends State<PersistDataWithSQLitePage> {
  dynamic db; // Base de datos que puede ser Sembast o SQLite
  final store = intMapStoreFactory.store(); // Almacén para Sembast

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    db = await DatabaseInitializer.initialize();
    setState(() {});
  }

  Future<void> addDog() async {
    if (db is Database) {
      // Si es SQLite
      await db.insert('dogs', {'name': 'Dog ${DateTime.now().second}', 'age': 2});
    } else if (db != null) {
      // Si es Sembast
      await store.add(db, {'name': 'Dog ${DateTime.now().second}', 'age': 2});
    }
    setState(() {});
  }

  Future<List<Map<String, dynamic>>> fetchDogs() async {
    if (db is Database) {
      // Si es SQLite
      return await db.query('dogs');
    } else if (db != null) {
      // Si es Sembast
      final records = await store.find(db);
      return records
          .map((record) => {'id': record.key, ...record.value})
          .toList();
    }
    return [];
  }

  Future<void> deleteDog(dynamic id) async {
    if (db is Database) {
      // Si es SQLite
      await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
    } else if (db != null) {
      // Si es Sembast
      await store.record(id).delete(db);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persist Data with SQLite'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchDogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final dogsList = snapshot.data!;
            return ListView.builder(
              itemCount: dogsList.length,
              itemBuilder: (context, index) {
                final dog = dogsList[index];
                return ListTile(
                  title: Text('${dog['name']} (Age: ${dog['age']})'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteDog(dog['id']),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No dogs found.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addDog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
