// pages/Bab5.dart

import 'package:flutter/material.dart';

// Model sederhana untuk data produk
class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  const Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}

// Halaman utama untuk Bab 5 (Daftar Produk)
class Bab5 extends StatelessWidget {
  const Bab5({super.key});

  // Data produk hardcode
  final List<Product> products = const [
    Product(
      name: 'Smartwatch',
      // Diubah ke path lokal
      imageUrl: 'assets/images/Smartwatch.jpeg',
      price: 560000,
      description: 'Smartwatch terbaik dengan spek dewa untuk olahraga.',
    ),
    Product(
      name: 'Sepatu Bola',
      // Diubah ke path lokal
      imageUrl: 'assets/images/ortuseight.jpeg',
      price: 780000,
      description: 'Sepatu dengan switch emas yang berkualitas tapi memuaskan.',
    ),
    Product(
      name: 'Samasung A55',
      // Diubah ke path lokal
      imageUrl: 'assets/images/samsung-a55.jpeg',
      price: 5599999,
      description: 'Samsung A55 yang menggunakan teknologi terbaru dan memuaskan.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bab 5: Navigasi & Routing'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.network(product.imageUrl, width: 60),
              title: Text(product.name),
              subtitle: Text('Rp${product.price.toStringAsFixed(0)}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke halaman detail saat item diketuk
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Melewatkan data produk melalui konstruktor
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Halaman kedua untuk Bab 5 (Detail Produk)
// Diletakkan di file yang sama agar mudah dikelola dalam contoh ini
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  // Konstruktor untuk menerima data produk
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Rp${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 22, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            const Spacer(), // Mendorong tombol ke bawah
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman sebelumnya
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Daftar'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
