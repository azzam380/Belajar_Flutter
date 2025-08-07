import 'package:flutter/material.dart';

// ⁡⁣⁢⁣Contoh StatelessWidget sederhana⁡
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Konstruktor dengan key opsional
//   @override
//   Widget build(BuildContext context) {
//     // Metode build() untuk mengembalikan struktur UI
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Stateless Widget Example')),
//         body: const Center(
//           child: Text(
//             'Saya adalah Stateless Widget!',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }







// ⁡⁣⁢⁣Contoh StatefulWidget sederhana⁡
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});
  @override
  State<CounterApp> createState() => _CounterAppState(); // Membuat objek State
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0; // State yang dapat berubah
  void _incrementCounter() {
    setState(() {
      // Metode setState() memberitahu Flutter untuk membangun ulang widget
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stateful Widget Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Anda telah menekan tombol sebanyak:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_counter', // Menampilkan state _counter
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Memberi jarak
              ElevatedButton(
                onPressed:
                    _incrementCounter, // Memanggil fungsi untuk mengubah state
                child: const Text('Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const CounterApp());
}
