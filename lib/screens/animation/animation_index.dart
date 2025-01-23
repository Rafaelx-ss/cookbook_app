import 'package:flutter/material.dart';
import 'page_route_transition.dart';
import 'widget_using_physics.dart';
import 'properties_of_container.dart';
import 'fade_widget_in_out.dart';


class AnimationIndex extends StatelessWidget {
  const AnimationIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Activities'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Animate a page route transition'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageRouteTransition()),
            ),
          ),
          ListTile(
            title: const Text('Animate a widget using a physics simulation'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WidgetUsingPhysics()),
            ),
          ),
          ListTile(
            title: const Text('Animate the properties of a container'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PropertiesOfContainer()),
            ),
          ),
          ListTile(
            title: const Text('Fade a widget in and out'),
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