import 'package:flutter/material.dart';
import 'persist_data_with_sqlite.dart';
import 'read_and_write_files.dart';
import 'store_key_value_data.dart';

class DataPersistenceIndex extends StatelessWidget {
  const DataPersistenceIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Persistence Activities'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Persist Data with SQLite'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersistDataWithSQLitePage()),
            ),
          ),
          ListTile(
            title: const Text('Read and Write Files'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FlutterDemo(storage: CounterStorage())),
            ),
          ),
          ListTile(
            title: const Text('Store Key-Value Data'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Store Key-Value Data')),
            ),
          ),
        ],
      ),
    );
  }
}
