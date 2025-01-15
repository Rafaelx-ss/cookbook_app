import 'package:flutter/material.dart';

class CustomFontExample extends StatelessWidget {
  const CustomFontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Font Example'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Custom Font Text',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Regular Font Text',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
