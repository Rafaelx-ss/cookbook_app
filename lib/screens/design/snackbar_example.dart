import 'package:flutter/material.dart';

class SnackbarExample extends StatelessWidget {
  const SnackbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('This is a snackbar'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Code to undo the change
                  },
                ),
              ),
            );
          },
          child: const Text('Show Snackbar'),
        ),
      ),
    );
  }
}