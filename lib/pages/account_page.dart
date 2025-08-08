import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akun Saya'), backgroundColor: Colors.deepPurple, elevation: 1),
      body: const Center(child: Text('Halaman Akun Pengguna', style: TextStyle(fontSize: 18, color: Colors.grey))),
    );
  }
}