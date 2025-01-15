import 'package:flutter/material.dart';

class FontToPackageExample extends StatelessWidget {
  const FontToPackageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a snackbar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Hola mundo xd'),
                action: SnackBarAction(
                  label: 'Cerrar',
                  onPressed: () {
                    // Code to undo the change
                  },
                ),
              ),
            );
          },
          child: const Text('Click aqui "snackbar"'),
        ),
      ),
    );
  }
}