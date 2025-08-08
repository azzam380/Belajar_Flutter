import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'list_chat.dart';
import 'account_page.dart';
import '../models/product_model.dart';
import 'product_detail_page.dart';

// KONTEN TAB HOME (PENCARIAN + GRID)
class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final List<Product> dummyProducts = const [
    Product(
      id: 'p1',
      name: 'Sepatu Lari Pria Nike',
      description:
          'Sepatu lari yang sangat ringan dan nyaman, dibuat dengan teknologi bantalan terbaru.',
      price: 750000,
      imageUrl: 'assets/images/Nike.jpeg',
    ),
    Product(
      id: 'p2',
      name: 'Helm KYT',
      description:
          'KYT adalah merek helm asal Indonesia yang sangat populer dan sudah mendunia. Kualitasnya diakui secara internasional dan bahkan digunakan oleh pembalap di ajang balap bergengsi seperti MotoGP..',
      price: 1250000,
      imageUrl: 'assets/images/helm-kyt.jpeg',
    ),
    Product(
      id: 'p2',
      name: 'Samsung Galaxy A55',
      description:
          'Samsung Galaxy A55 adalah ponsel kelas menengah (mid-range) yang menjadi andalan Samsung. Ponsel ini dirancang sebagai "adik" dari seri flagship Galaxy S dengan harga yang lebih terjangkau.',
      price: 1250000,
      imageUrl: 'assets/images/samsung-a55.jpeg',
    ),
    Product(
      id: 'p2',
      name: 'Xiaomi 14T MI',
      description:
          'Xiaomi 14T adalah ponsel kelas flagship-killer atau sub-flagship. Seri "T" dari Xiaomi dikenal karena menawarkan spesifikasi performa tinggi yang mendekati seri utamanya (Xiaomi 14) namun dengan beberapa penyesuaian untuk menekan harga.',
      price: 1250000,
      imageUrl: 'assets/images/xiaomi-14t.jpeg',
    ),
    Product(
      id: 'p2',
      name: 'Smartwatch MI',
      description:
          'Smartwatch dengan desain yang modern. Tahan air hingga 50m dan strap terbuat dari plastik.',
      price: 1250000,
      imageUrl: 'assets/images/Smartwatch.jpeg',
    ),
    // Tambahkan produk lain di sini jika perlu
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<Product> displayedProducts = _searchQuery.isEmpty
        ? dummyProducts
        : dummyProducts
              .where(
                (product) => product.name.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
              )
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Saya'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                labelText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              itemCount: displayedProducts.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) {
                final product = displayedProducts[i];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rp ${product.price.toStringAsFixed(0)}',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// WIDGET UTAMA DENGAN BOTTOM NAVIGATION BAR
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    CartPage(),
    ChatListPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
