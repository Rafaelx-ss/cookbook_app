import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticatedRequestsPage extends StatelessWidget {
  const AuthenticatedRequestsPage({super.key});

  Future<Album> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {
        // Añade tu token de API aquí
        HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      return Album.fromJson(responseJson);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticated Requests'),
      ),
      body: FutureBuilder<Album>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final album = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Album ID: ${album.id}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'User ID: ${album.userId}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Title: ${album.title}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
