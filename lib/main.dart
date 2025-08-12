// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import provider dan semua halaman Anda
import 'package:belajar_flutter/providers/calculator_provider.dart';
import 'package:belajar_flutter/pages/Homepage.dart';
import 'package:belajar_flutter/pages/Bab1.dart';
import 'package:belajar_flutter/pages/Bab2.dart';
import 'package:belajar_flutter/pages/Bab3.dart';
import 'package:belajar_flutter/pages/Bab4.dart';

void main() {
  runApp(
    // 1. Bungkus aplikasi dengan provider yang benar
    ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Online', // Sesuai kode Anda
      // 2. Ganti rute awal ke '/' yang akan menjadi Homepage
      initialRoute: '/',

      // Rute-rute ini sudah benar sesuai struktur Anda
      routes: {
        '/': (context) => const Homepage(),
        'Bab1': (context) => const Bab1(),
        'Bab2': (context) => const Bab2(),
        'Bab3': (context) => const Bab3(),
        'Bab4': (context) => const Bab4(),
      },
    );
  }
}
