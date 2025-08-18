import 'package:flutter/material.dart';

// Fungsi main untuk menjalankan aplikasi
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        // Atur style default untuk ElevatedButton agar seragam
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade400, // Warna tombol
            foregroundColor: Colors.white, // Warna teks tombol
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
      // Definisikan rute agar Navigator.pushNamed berfungsi
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        'Bab1': (context) => const PlaceholderScreen(chapter: 'Bab 1'),
        'Bab2': (context) => const PlaceholderScreen(chapter: 'Bab 2'),
        'Bab3': (context) => const PlaceholderScreen(chapter: 'Bab 3'),
        'Bab4': (context) => const PlaceholderScreen(chapter: 'Bab 4'),
        'Bab5': (context) => const PlaceholderScreen(chapter: 'Bab 5'),
        'Bab6': (context) => const PlaceholderScreen(chapter: 'Bab 6'),
      },
    );
  }
}

// Halaman utama dengan animasi dan gradasi
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Kurva animasi untuk memberikan efek 'mental' saat muncul
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    // Kombinasi 3 animasi untuk 1 kontainer
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(curve);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(curve);

    // Mulai animasi
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Belajar Flutter - Menu Utama',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      // Gunakan Container untuk menambahkan latar belakang gradasi
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300, // Warna atas
              Colors.indigo.shade900, // Warna bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          // Gabungkan 3 transisi untuk efek yang kaya
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                // 1. Semua elemen UI sekarang ada di dalam satu kontainer
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                      0.25,
                    ), // Latar belakang semi-transparan
                    borderRadius: BorderRadius.circular(20), // Sudut membulat
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize:
                        MainAxisSize.min, // Agar kontainer tidak memenuhi layar
                    children: [
                      const Text(
                        'Pilih Latihan:',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'Bab1'),
                        child: const Text('Latihan Bab 1 - Dasar Dart'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'Bab2'),
                        child: const Text('Latihan Bab 2 - Biodata App'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'Bab3'),
                        child: const Text('Latihan Bab 3 - Profile Card'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'Bab4'),
                        child: const Text('Latihan Bab 4 - Kalkulator'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'Bab5'),
                        child: const Text('Latihan Bab 5 - Todo List'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'Bab6'),
                        child: const Text('Latihan Bab 6 - Photo Viewer'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Placeholder untuk tujuan navigasi
class PlaceholderScreen extends StatelessWidget {
  final String chapter;
  const PlaceholderScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Halaman $chapter',
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman untuk $chapter.',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
