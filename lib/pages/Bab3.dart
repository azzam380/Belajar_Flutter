import 'package:flutter/material.dart';

// Widget ini merepresentasikan halaman untuk Latihan Bab 3.
class Bab3 extends StatelessWidget {
  const Bab3({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman seperti AppBar dan Body.
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Warna latar belakang halaman
      appBar: AppBar(
        title: const Text('My Profile Card', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[800],
      ),
      // 5. Center: Memastikan semua elemen berada di tengah layar.
      body: Center(
        // 4. Card: Membungkus seluruh elemen profil dengan tampilan kartu.
        // Card secara default sudah memiliki sudut membulat dan bayangan.
        child: Card(
          margin: const EdgeInsets.all(20.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            // 3. Column: Menyusun semua elemen secara vertikal dari atas ke bawah.
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Membuat ukuran Column sesuai kontennya
              children: [
                // 2a. Foto Profil: Menggunakan CircleAvatar agar gambar berbentuk lingkaran.
                const CircleAvatar(
                  radius: 70,
                  // ✅ Gunakan backgroundImage dengan AssetImage
                  backgroundImage: AssetImage('assets/images/kereta.jpg'),
                ),
                // 6. SizedBox: Memberikan jarak vertikal antara foto dan nama.
                const SizedBox(height: 20),
                // 2b. Nama Lengkap: Widget Text untuk menampilkan nama.
                const Text(
                  'Ghifari',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // 2c. Profesi: Widget Text untuk menampilkan pekerjaan.
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontSize: 16.0,
                    letterSpacing: 1.5,
                  ),
                ),
                // Garis pemisah untuk estetika.
                const SizedBox(height: 20, width: 150, child: Divider()),
                // 2d. Ikon Media Sosial: Disusun secara horizontal menggunakan Row.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.facebook, color: Colors.blueGrey[900], size: 35),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.blueGrey[900],
                      size: 35,
                    ),
                    Icon(Icons.email, color: Colors.blueGrey[900], size: 35),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
