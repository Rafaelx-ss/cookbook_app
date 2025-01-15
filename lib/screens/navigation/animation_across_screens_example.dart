import 'package:flutter/material.dart';

class AnimationAcrossScreensExample extends StatelessWidget {
  const AnimationAcrossScreensExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Across Screens'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          20,
          (index) => Hero(
            tag: 'imageHero$index',
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(tag: 'imageHero$index');
                  }));
                },
                child: Image.network(
                  'https://picsum.photos/seed/$index/200',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String tag;

  const DetailScreen({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: tag,
            child: Image.network(
              'https://picsum.photos/seed/${tag.substring(9)}/400',
            ),
          ),
        ),
      ),
    );
  }
}