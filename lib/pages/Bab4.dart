// lib/pages/Bab4.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class Bab4 extends StatelessWidget {
  const Bab4({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller diletakkan di dalam build agar tidak menyebabkan error saat Hot Reload
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

    // Mengambil instance provider tanpa listen, karena hanya untuk memanggil fungsi
    final calculatorProvider = Provider.of<CalculatorProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Latihan Bab 4 - Calculator', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Agar children meregang
          children: [
            TextField(
              controller: controller1,
              decoration: const InputDecoration(labelText: 'Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller2,
              decoration: const InputDecoration(labelText: 'Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            
            // PERBAIKAN: Gunakan Row dengan Expanded pada setiap tombol
            Row(
              children: [
                // Tombol Tambah
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => calculatorProvider.calculate(
                      controller1.text,
                      controller2.text,
                      '+',
                    ),
                    child: const Text('+'),
                  ),
                ),
                const SizedBox(width: 8), // Beri jarak antar tombol

                // Tombol Kurang
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => calculatorProvider.calculate(
                      controller1.text,
                      controller2.text,
                      '-',
                    ),
                    child: const Text('-'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8), // Jarak antar baris tombol
            Row(
              children: [
                // Tombol Kali
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => calculatorProvider.calculate(
                      controller1.text,
                      controller2.text,
                      'x',
                    ),
                    child: const Text('x'),
                  ),
                ),
                const SizedBox(width: 8), // Beri jarak antar tombol

                // Tombol Bagi
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => calculatorProvider.calculate(
                      controller1.text,
                      controller2.text,
                      '/',
                    ),
                    child: const Text('/'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            
            // Consumer akan otomatis update saat hasilnya berubah
            Consumer<CalculatorProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: Text(
                    'Hasil: ${provider.result}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}