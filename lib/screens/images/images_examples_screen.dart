import 'package:flutter/material.dart';
import 'internet_image_example.dart';
import 'fade_in_image_example.dart';

class ImagesExamplesScreen extends StatelessWidget {
  const ImagesExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images Examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Internet Image Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InternetImageExample()),
            ),
          ),
          ListTile(
            title: const Text('Fade In Image Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FadeInImageExample()),
            ),
          ),
        ],
      ),
    );
  }
}