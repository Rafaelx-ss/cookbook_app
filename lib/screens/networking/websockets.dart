import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketsPage extends StatefulWidget {
  const WebSocketsPage({super.key});

  @override
  State<WebSocketsPage> createState() => _WebSocketsPageState();
}

class _WebSocketsPageState extends State<WebSocketsPage> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'), // Servidor WebSocket de ejemplo
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? 'Received: ${snapshot.data}' : '',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text); // Envía el mensaje al servidor WebSocket
    }
  }

  @override
  void dispose() {
    _channel.sink.close(); // Cierra la conexión del WebSocket
    _controller.dispose();
    super.dispose();
  }
}
