// lib/pages/Bab9.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Class Notifier untuk state management
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

// Halaman UI untuk Bab 9
class Bab9 extends StatelessWidget {
  const Bab9({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Bab 9: State Management (Provider)', style: TextStyle(color: Colors.white)),
          centerTitle: true,
                  leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Tambahkan padding horizontal
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nilai Counter Saat Ini:',
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 10),
                
                Consumer<CounterProvider>(
                  builder: (context, counter, child) {
                    return Text(
                      '${counter.count}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 30),
                
                // --- BAGIAN YANG DIPERBAIKI ---
                Row(
                  children: [
                    // Bungkus tombol pertama dengan Expanded
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Provider.of<CounterProvider>(context, listen: false).decrement();
                        },
                        icon: const Icon(Icons.remove),
                        label: const Text('Kurang'),
                      ),
                    ),
                    const SizedBox(width: 16), // Beri jarak antar tombol
                    // Bungkus tombol kedua dengan Expanded
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Provider.of<CounterProvider>(context, listen: false).increment();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Tambah'),
                      ),
                    ),
                  ],
                ),
                // -----------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}