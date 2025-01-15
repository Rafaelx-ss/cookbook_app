import 'package:flutter/material.dart';

class LongListExample extends StatelessWidget {
  const LongListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long List Example'),
      ),
      body: ListView.builder(
        itemCount: 10000,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}