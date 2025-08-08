import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesan'), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white ,elevation: 1),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.store)),
            title: const Text('Nike Official'),
            subtitle: const Text('Baik, pesanan Anda sedang kami proses...'),
            trailing: const Text('10:32'),
            onTap: () => Navigator.pushNamed(context, 'ChatDetail'),
          ),
        ],
      ),
    );
  }
}