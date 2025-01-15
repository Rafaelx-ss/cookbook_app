import 'package:flutter/material.dart';

class SpacedItemsExample extends StatelessWidget {
  const SpacedItemsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaced Items Example'),
      ),
      body: ListView.separated(
        itemCount: 25,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}