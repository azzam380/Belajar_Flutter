

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Belajar Flutter - Menu Utama',
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih Latihan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 40), 
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'Bab1');
              },
              child: const Text('Latihan Bab 1 - Dasar Dart'),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 40)),
              onPressed: () {
                Navigator.pushNamed(context, 'Bab2');
              },
              child: const Text('Latihan Bab 2 - Biodata App'),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 40)),
              onPressed: () {
                Navigator.pushNamed(context, 'Bab3');
              },
              child: const Text('Latihan Bab 3 - Profile Card'),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 40)),
              onPressed: () {
                Navigator.pushNamed(context, 'Bab4');
              },
              child: const Text('Latihan Bab 4 - Kalkulator'),
            ),
          ],
        ),
      ),
    );
  }
}
