import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context, dynamic Co1lors) {
    return MaterialApp(
      title: 'Product Page',
      theme: ThemeData(
        primarySwatch: Co1lors.blue,
      ),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String productName = "Pullover";
  final String color = "Black";
  final String size = "L";
  final double price = 51.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Placeholder
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Text('Product Image', style: TextStyle(fontSize: 20))),
            ),
            SizedBox(height: 16),
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Color: $color', style: TextStyle(fontSize: 18)),
            Text('Size: $size', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('\$$price', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add to cart action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$productName added to cart!')),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}