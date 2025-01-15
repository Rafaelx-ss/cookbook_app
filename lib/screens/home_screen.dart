import 'package:flutter/material.dart';
import 'design/design_examples_screen.dart';
import 'images/images_examples_screen.dart';
import 'lists/lists_examples_screen.dart';
import 'navigation/navigation_examples_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rafael Solis - Flutter Cookbook'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection(
            context,
            'Desing - Activities ',
            'Drawer, Snackbar, Fonts, Themes and tabs',
            const DesignExamplesScreen(),
          ),
          _buildSection(
            context,
            'Images - Activities',
            'Internet images and image fade-in',
            const ImagesExamplesScreen(),
          ),
          _buildSection(
            context,
            'Lists - Activities',
            'Grid lists, horizontal lists...',
            const ListsExamplesScreen(),
          ),
          _buildSection(
            context,
            'Navigation - Activities',
            'Routes, animations...',
            const NavigationExamplesScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String subtitle,
    Widget destination,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}