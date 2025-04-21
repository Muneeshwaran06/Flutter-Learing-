import 'package:flutter/material.dart';
import 'product_list_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy product list
    final products = [
      {'name': 'T-Shirt', 'price': '₹499'},
      {'name': 'Jeans', 'price': '₹999'},
      {'name': 'Shoes', 'price': '₹1999'},
    ];

    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(products[index]['name']!),
              subtitle: Text(products[index]['price']!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                ProductDetailScreen(name: products[index]['name']!,
                price: products[index]['price']!,
                ),
                ),
                );
                // We'll connect to Product Detail screen later
              },
            ),
          );
        },
      ),
      ),
    );
  }
}