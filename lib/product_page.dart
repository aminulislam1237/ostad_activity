import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> products = [
    Product(name: "Pullover", color: "Black", size: "L", price: 51.0, quantity: 0),
    Product(name: "T-Shirt", color: "Gray", size: "L", price: 30.0, quantity: 0),
    Product(name: "Sport Dress", color: "Black", size: "M", price: 43.0, quantity: 0),
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount = products.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/image/shirt.jpg'),
                          Container(
                            height: 50,
                            color: Colors.grey[300],
                            child: Center(
                              child: Text(
                                product.name,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Color: ${product.color}', style: TextStyle(fontSize: 18)),
                          Text('Size: ${product.size}', style: TextStyle(fontSize: 18)),
                          SizedBox(height: 8),
                          Text('\$${product.price}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Quantity: ${product.quantity}', style: TextStyle(fontSize: 18)),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (product.quantity > 1) {
                                          product.quantity--;
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        product.quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Total Amount and Check Out Button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Ammount: \$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Set button color to orange
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    // Check out action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Checking out for \$${totalAmount.toStringAsFixed(2)}!')),
                    );
                  },
                  child: Text('Check Out'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;

  Product({required this.name, required this.color, required this.size, required this.price, required this.quantity});
}