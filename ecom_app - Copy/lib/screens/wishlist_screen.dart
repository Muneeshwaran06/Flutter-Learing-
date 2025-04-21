  import  'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import '../providers/wishlist_provider.dart';

  class WishlistScreen extends StatelessWidget {
    const WishlistScreen({super.key});

    @override
    Widget build(BuildContext context) {
      final wishlist = Provider.of<WishlistProvider>(context);

      return Scaffold(
        appBar: AppBar(title: const Text('Your Wishlist')),
        body: wishlist.items.isEmpty
            ? const Center(child: Text('No items yet 💔'))
            : ListView.builder(
          itemCount: wishlist.items.length,
          itemBuilder: (context, index) {
            final product = wishlist.items[index];
            return ListTile(
              leading: Image.asset(product.image, width: 50),
              title: Text(product.title),
              subtitle: Text('₹${product.price}'),

              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => wishlist.toggleWishlist(product),
              ),
            );
          },
        ),
      );
    }
  }
