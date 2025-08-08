import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  // Getter untuk mengakses daftar item dari luar
  List<Product> get items => _items;

  // Getter untuk menghitung total harga
  double get totalPrice {
    return _items.fold(0.0, (sum, current) => sum + current.price);
  }

  // Fungsi untuk menambah item ke keranjang
  void add(Product product) {
    _items.add(product);
    // Beri tahu semua widget yang mendengarkan bahwa ada perubahan!
    notifyListeners();
  }

  // Fungsi untuk menghapus item dari keranjang
  void remove(Product product) {
    _items.remove(product);
    // Beri tahu semua widget yang mendengarkan bahwa ada perubahan!
    notifyListeners();
  }

  // Fungsi untuk mengosongkan keranjang
  void clear() {
    _items.clear();
    notifyListeners();
  }
}