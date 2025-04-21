import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String price;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const FlutterLogo(size: 150),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 24)),
            Text(price, style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context,listen: false).addItem(name, price);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item added to cart')),
                );
                // future: add to cart logic
              },
              child: const Text('Add to Cart'),
            ),

          ],
        ),
      ),
    );
  }
}