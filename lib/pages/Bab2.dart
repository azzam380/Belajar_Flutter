// lib/pages/Bab2.dart

import 'package:flutter/material.dart';

// Widget untuk halaman Latihan Bab 2.
// Sesuai materi, kita akan membuat halaman biodata sederhana.
class Bab2 extends StatelessWidget {
  // Konstruktor standar untuk widget.
  const Bab2({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan kerangka dasar untuk halaman.
    return Scaffold(
      // AppBar adalah bilah judul di bagian atas layar.
      appBar: AppBar(
        // Mengubah warna latar belakang AppBar sesuai permintaan latihan.
        backgroundColor: Colors.teal[700],
        title: const Text(
          'Latihan Bab 2 - Biodata App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // Body dari Scaffold, kita gunakan Center untuk menempatkan konten di tengah.
      body: const Center(
        // Column untuk menyusun widget secara vertikal (atas ke bawah).
        child: Column(
          // Menempatkan anak-anak Column di tengah secara vertikal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan nama lengkap.
            Text(
              'Windsurf', // Ganti dengan nama lengkap Anda
              style: TextStyle(
                // Mengatur ukuran font menjadi 30 sesuai permintaan latihan.
                fontSize: 30,
                fontWeight: FontWeight.bold, // Membuat teks menjadi tebal.
              ),
            ),
            // Memberi sedikit jarak antara nama dan kelas.
            SizedBox(height: 10),
            // Menampilkan kelas.
            Text(
              'Rekayasa Perangkat Lunak', // Ganti dengan kelas Anda
              style: TextStyle(
                fontSize:
                    20, // Ukuran font yang sedikit lebih kecil untuk kelas.
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
