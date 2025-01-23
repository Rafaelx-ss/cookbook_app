import 'package:flutter/material.dart';
import 'download_button.dart';
import 'nested_navigation_flow.dart';
import 'scrolling_parallax_effect.dart';
import 'shimmer_loading_effect.dart';
import 'staggered_menu_animation.dart';
import 'typing_indicator.dart';
import 'expandable_fab.dart';
import 'gradient_chat_bubbles.dart';
import 'ui_element.dart';

class EffectsIndex extends StatelessWidget {
  const EffectsIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Activities'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Download button animation'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
          ListTile(
            title: const Text('Nested navigation flow'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SetupFlow(setupPageRoute: routeDeviceSetupStartPage)),
            ),
          ),
          ListTile(
            title: const Text('Scrolling parallax effect'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleParallax()),
            ),
          ),
          ListTile(
            title: const Text('Shimmer loading effect'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
          ListTile(
            title: const Text('Staggered menu animation'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
          ListTile(
            title: const Text('Typing indicator animation'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
          ListTile(
            title: const Text('Expandable FAB'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
          ListTile(
            title: const Text('Gradient chat bubbles'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
          ListTile(
            title: const Text('UI Element Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExampleCupertinoDownloadButton()),
            ),
          ),
        ],
      ),
    );
  }
}
