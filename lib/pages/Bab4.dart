// lib/pages/Bab4.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class Bab4 extends StatelessWidget {
  const Bab4({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

    final calculatorProvider = Provider.of<CalculatorProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Latihan Bab 4 - Calculator', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculatorProvider.calculate(
                    controller1.text,
                    controller2.text,
                    '+',
                  ),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => calculatorProvider.calculate(
                    controller1.text,
                    controller2.text,
                    '-',
                  ),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => calculatorProvider.calculate(
                    controller1.text,
                    controller2.text,
                    'x',
                  ),
                  child: const Text('x'),
                ),
                ElevatedButton(
                  onPressed: () => calculatorProvider.calculate(
                    controller1.text,
                    controller2.text,
                    '/',
                  ),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Consumer akan otomatis update saat hasilnya berubah
            Consumer<CalculatorProvider>(
              builder: (context, provider, child) {
                return Text(
                  'Hasil: ${provider.result}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
