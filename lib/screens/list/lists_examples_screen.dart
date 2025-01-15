import 'package:flutter/material.dart';
import 'grid_list_example.dart';
import 'horizontal_list_example.dart';
import 'mixed_list_example.dart';
import 'floating_app_bar_example.dart';
import 'basic_list_example.dart';
import 'long_list_example.dart';
import 'spaced_items_example.dart';

class ListsExamplesScreen extends StatelessWidget {
  const ListsExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists Examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Grid List Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GridListExample()),
            ),
          ),
          ListTile(
            title: const Text('Horizontal List Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HorizontalListExample()),
            ),
          ),
          ListTile(
            title: const Text('Mixed List Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MixedListExample()),
            ),
          ),
          ListTile(
            title: const Text('Floating App Bar Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FloatingAppBarExample()),
            ),
          ),
          ListTile(
            title: const Text('Basic List Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BasicListExample()),
            ),
          ),
          ListTile(
            title: const Text('Long List Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LongListExample()),
            ),
          ),
          ListTile(
            title: const Text('Spaced Items Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SpacedItemsExample()),
            ),
          ),
        ],
      ),
    );
  }
}