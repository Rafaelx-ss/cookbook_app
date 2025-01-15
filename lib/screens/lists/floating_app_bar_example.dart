import 'package:flutter/material.dart';

class FloatingAppBarExample extends StatelessWidget {
  const FloatingAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Floating App Bar'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}