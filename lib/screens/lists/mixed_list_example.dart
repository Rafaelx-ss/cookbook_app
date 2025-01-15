import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String type;

  ListItem(this.title, this.type);
}

class MixedListExample extends StatelessWidget {
  const MixedListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? ListItem('Heading $i', 'heading')
          : ListItem('Item $i', 'item'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mixed List Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          if (item.type == 'heading') {
            return ListTile(
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }
          return ListTile(
            title: Text(item.title),
          );
        },
      ),
    );
  }
}