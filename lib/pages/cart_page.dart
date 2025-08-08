import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Keranjang Saya'), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white ,elevation: 1),
          body: cart.items.isEmpty
              ? const Center(child: Text('Keranjang Anda masih kosong.', style: TextStyle(fontSize: 18, color: Colors.grey)))
              : ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) {
                    final product = cart.items[i];
                    return ListTile(
                      leading: Image.asset(product.imageUrl, width: 50, fit: BoxFit.cover),
                      title: Text(product.name),
                      subtitle: Text('Rp ${product.price.toStringAsFixed(0)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => cart.remove(product),
                      ),
                    );
                  },
                ),
          bottomNavigationBar: cart.items.isEmpty
              ? null
              : BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: Rp ${cart.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          onPressed: () { /* Logika Checkout */ },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                          child: const Text('Checkout', style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}