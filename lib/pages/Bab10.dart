// lib/pages/Bab10.dart
import 'dart:math';
import 'package:flutter/material.dart';

// Halaman utama untuk Bab 10 (Stateful karena warna bisa berubah)
class Bab10 extends StatefulWidget {
  const Bab10({super.key});
  @override
  _Bab10State createState() => _Bab10State();
}

class _Bab10State extends State<Bab10> {
  // State untuk menyimpan warna latar belakang
  Color _backgroundColor = Colors.blueGrey.shade100;

  // Fungsi untuk mengubah state warna secara acak
  void _changeBackgroundColor() {
    final random = Random();
    // Panggil setState untuk memberitahu UI agar update dengan warna baru
    setState(() {
      _backgroundColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: const Text(
          'Bab 10: UI Kompleks & Animasi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // AnimatedContainer akan menganimasikan perubahan warna secara otomatis
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: _backgroundColor,
        child: const Center(
          // Menggunakan Custom Widget 'ProfileCard'
          child: ProfileCard(
            name: 'John Doe',
            profession: 'Software Engineer',
            imageUrl: 'https://picsum.photos/id/237/200',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeBackgroundColor,
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}

// 1. Custom Widget untuk Kartu Profil
class ProfileCard extends StatelessWidget {
  final String name;
  final String profession;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.profession,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi standar Flutter tanpa GetX
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailScreen(
              name: name,
              profession: profession,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 3. Hero Animation: Widget yang akan "terbang"
              Hero(
                tag: imageUrl, // Tag harus unik untuk setiap hero
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                profession,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Detail untuk tujuan Hero Animation
class ProfileDetailScreen extends StatelessWidget {
  final String name;
  final String profession;
  final String imageUrl;

  const ProfileDetailScreen({
    super.key,
    required this.name,
    required this.profession,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3. Hero Animation: Tujuan dari widget yang "terbang"
            Hero(
              tag: imageUrl, // Tag harus sama dengan hero di halaman asal
              child: CircleAvatar(
                radius: 120, // Gambar menjadi lebih besar
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              profession,
              style: const TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
