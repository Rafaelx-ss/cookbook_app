//lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'design/design_examples_screen.dart';
import 'images/images_examples_screen.dart';
import 'lists/lists_examples_screen.dart';
import 'actividad1/namer_app_screen.dart';
import 'navigation/navigation_examples_screen.dart';
import 'animation/animation_index.dart';
import 'effects/effects_index.dart';
import 'persistence/data_storage_index.dart';
import 'networking/networking_index.dart';

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
          _buildSection(
            context,
            'Actividad 1',
            'Your first Flutter app',
            const NamerAppScreen(),
          ),
          _buildSection(
            context,
            'Animation',
            'Animate a: Page, Widget, Property and more',
            const AnimationIndex(),
          ),
          _buildSection(
            context,
            'Effects',
            'Your first Flutter app',
            const EffectsIndex(),
          ),
          _buildSection(
            context,
            'Persistence',
            'Your first Flutter app',
            const DataPersistenceIndex(),
          ),
          _buildSection(
            context,
            'Networking',
            'Your first Flutter app',
            const NetworkingIndex(),
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