import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}

class SendDataPage extends StatefulWidget {
  const SendDataPage({super.key});

  @override
  State<SendDataPage> createState() {
    return _SendDataPageState();
  }
}

class _SendDataPageState extends State<SendDataPage> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Data to the Internet'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureAlbum == null) ? buildInputColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildInputColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('Send Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Album Created!',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'ID: ${snapshot.data!.id}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Title: ${snapshot.data!.title}',
                style: const TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureAlbum = null;
                    _controller.clear();
                  });
                },
                child: const Text('Create Another'),
              ),
            ],
          );
        } else {
          return const Text('No data.');
        }
      },
    );
  }
}
