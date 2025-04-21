import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/wishlist_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Product> dummyProducts = [
    Product(id: '1', title: 'Product 1', price: 20, image: 'assets/images/a.jpg'),
    Product(id: '2', title: 'Product 2', price: 30, image: 'assets/images/b.jpg'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/wishlist');
    }
  }

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecom App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/user'),
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/wishlist'),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: dummyProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) {
          final product = dummyProducts[i];
          final isInWishlist = wishlist.items.contains(product);

          return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(
          child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Image.asset(
          product.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
          const Center(child: Icon(Icons.image_not_supported)),
          ),
          ),
          ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('₹${product.price}', style: const TextStyle(color: Colors.grey)),
          IconButton(
          icon: Icon(
          isInWishlist ? Icons.favorite : Icons.favorite_border,
          color: isInWishlist ? Colors.red : null,
          ),
          onPressed: () => isInWishlist
          ? wishlist.removeFromWishlist(product)
              : wishlist.addToWishlist(product),
          ),
          ],
          ),
          ),
          ],
          ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        ],
      ),
    );
  }
}