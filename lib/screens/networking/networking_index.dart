import 'package:flutter/material.dart';
import 'fetch_data.dart';
import 'authenticated_requests.dart';
import 'send_data.dart';
import 'update_data.dart';
import 'delete_data.dart';
import 'websockets.dart';
import 'parse_json.dart';

class NetworkingIndex extends StatelessWidget {
  const NetworkingIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking Activities'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Fetch data from the internet'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FetchDataPage()),
            ),
          ),
          ListTile(
            title: const Text('Make authenticated requests'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AuthenticatedRequestsPage()),
            ),
          ),
          ListTile(
            title: const Text('Send data to the internet'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SendDataPage()),
            ),
          ),
          ListTile(
            title: const Text('Update data over the internet'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpdateDataPage()),
            ),
          ),
          ListTile(
            title: const Text('Delete data on the internet'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DeleteDataPage()),
            ),
          ),
          ListTile(
            title: const Text('Communicate with WebSockets'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WebSocketsPage()),
            ),
          ),
          ListTile(
            title: const Text('Parse JSON in the background'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ParseJsonPage()),
            ),
          ),
        ],
      ),
    );
  }
}
