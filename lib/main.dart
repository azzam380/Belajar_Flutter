// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:belajar_flutter/providers/calculator_provider.dart';
import 'package:belajar_flutter/pages/Homepage.dart';
import 'package:belajar_flutter/pages/Bab1.dart';
import 'package:belajar_flutter/pages/Bab2.dart';
import 'package:belajar_flutter/pages/Bab3.dart';
import 'package:belajar_flutter/pages/Bab4.dart';
import 'package:belajar_flutter/pages/Bab5.dart';
import 'package:belajar_flutter/pages/Bab6.dart';

void main() {
  runApp(
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
      title: 'Belajar Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade400,
            foregroundColor: Colors.white,
            minimumSize: const Size(280, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        'Bab1': (context) => const Bab1(),
        'Bab2': (context) => const Bab2(),
        'Bab3': (context) => const Bab3(),
        'Bab4': (context) => const Bab4(),
        'Bab5': (context) => const Bab5(),
        'Bab6': (context) => const Bab6(),
      },
    );
  }
}
