// lib/pages/Bab7.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model Class untuk data foto
class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

// Halaman utama untuk Bab 7
class Bab7 extends StatefulWidget {
  const Bab7({super.key});

  @override
  State<Bab7> createState() => _Bab7State();
}

class _Bab7State extends State<Bab7> {
  late Future<List<Photo>> _photosFuture;

  @override
  void initState() {
    super.initState();
    _photosFuture = fetchPhotos();
  }

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // Batasi hanya 50 foto agar tidak terlalu berat
      return jsonResponse
          .take(50)
          .map((photo) => Photo.fromJson(photo))
          .toList();
    } else {
      throw Exception('Gagal memuat foto dari API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Bab 7: Bekerja dengan API',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _photosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final photos = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailScreen(photo: photo),
                      ),
                    );
                  },
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text(
                        photo.title,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    child: Image.network(photo.thumbnailUrl, fit: BoxFit.cover),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Tidak ada data'));
          }
        },
      ),
    );
  }
}

// Halaman detail untuk foto
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;
  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photo.title)),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
          photo.url,
          loadingBuilder: (context, child, progress) {
            return progress == null ? child : const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
