import 'package:flutter/material.dart';
import 'animation_across_screens_example.dart';
import 'basic_navigation_example.dart';
import 'named_routes_example.dart';
import 'pass_arguments_example.dart';
import 'return_data_example.dart';
import 'send_data_example.dart';

class NavigationExamplesScreen extends StatelessWidget {
  const NavigationExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Animation Across Screens'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AnimationAcrossScreensExample()),
            ),
          ),
          ListTile(
            title: const Text('Basic Navigation'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BasicNavigationExample()),
            ),
          ),
          ListTile(
            title: const Text('Named Routes'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NamedRoutesExample()),
            ),
          ),
          ListTile(
            title: const Text('Pass Arguments'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PassArgumentsExample()),
            ),
          ),
          ListTile(
            title: const Text('Return Data'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReturnDataExample()),
            ),
          ),
          ListTile(
            title: const Text('Send Data'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SendDataExample()),
            ),
          ),
        ],
      ),
    );
  }
}