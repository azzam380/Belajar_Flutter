import 'package:flutter/material.dart';

final List<Map<String, String>> photos = [
  {'title': 'Pegunungan', 'url': 'https://picsum.photos/id/10/400/600'},
  {'title': 'Kota Malam', 'url': 'https://picsum.photos/id/20/400/600'},
  {'title': 'Jembatan', 'url': 'https://picsum.photos/id/40/400/600'},
  {'title': 'Danau', 'url': 'https://picsum.photos/id/50/400/600'},
  {'title': 'Lampu Jalan', 'url': 'https://picsum.photos/id/60/400/600'},
  {'title': 'Jalan Berkerikil', 'url': 'https://picsum.photos/id/70/400/600'},
  {'title': 'Sungai', 'url': 'https://picsum.photos/id/90/400/600'},
  {'title': 'Pantai', 'url': 'https://picsum.photos/id/100/400/600'},
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Bab6(),
    );
  }
}

class Bab6 extends StatelessWidget {
  const Bab6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galeri Foto')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailScreen(
                      photoUrl: photos[index]['url']!,
                      photoTitle: photos[index]['title']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Image.network(
                        photos[index]['url']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        photos[index]['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PhotoDetailScreen extends StatelessWidget {
  final String photoUrl;
  final String photoTitle;

  const PhotoDetailScreen({
    super.key,
    required this.photoUrl,
    required this.photoTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photoTitle)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(photoUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  photoTitle,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
