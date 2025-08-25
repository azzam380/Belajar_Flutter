// lib/pages/Bab1.dart
import 'package:flutter/material.dart';

class Bab1 extends StatelessWidget {
  const Bab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Latihan Bab 1',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Text('Ini adalah halaman untuk latihan Bab 1.'),
      ),
    );
  }
}
