import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataPage extends StatelessWidget {
  const FetchDataPage({super.key});

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
