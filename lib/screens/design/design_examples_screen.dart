import 'package:flutter/material.dart';
import 'drawer_example.dart';
import 'snackbar_example.dart';
import 'fonttopackage_example.dart';
import 'orientation_example.dart';
import 'custom_font_example.dart';
import 'theme_example.dart';
import 'tabs_example.dart';

class DesignExamplesScreen extends StatelessWidget {
  const DesignExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Add a drawer to a screen'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DrawerExample()),
            ),
          ),
          ListTile(
            title: const Text('Display a snackbar'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SnackbarExample()),
            ),
          ),
          ListTile(
            title: const Text('Add a font to a package'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FontToPackageExample()),
            ),
          ),
          ListTile(
            title: const Text('Orientation Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrientationExample()),
            ),
          ),
          ListTile(
            title: const Text('Custom Font Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomFontExample()),
            ),
          ),
          ListTile(
            title: const Text('Theme Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThemeExample()),
            ),
          ),
          ListTile(
            title: const Text('Tabs Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TabsExample()),
            ),
          ),
        ],
      ),
    );
  }
}