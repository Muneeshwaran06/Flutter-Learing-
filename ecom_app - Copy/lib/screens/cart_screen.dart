import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: cart.items.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item['name'] ?? ''),
            subtitle: Text(
                item['price']?.toString().contains('₹') == true
                    ? item['price'].toString()
                    : '₹${item['price']}'
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                cart.removeItem(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            cart.clearCart();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cart cleared')),
            );
          },
          child: const Text('Clear Cart'),
        ),
      ),
    );
  }
}