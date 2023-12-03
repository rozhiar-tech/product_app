import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const ProductDetailPage({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(name)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Add functionality for sharing
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Add functionality for adding to favorites
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 450,
                    width: double.infinity,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 300, // Adjust the height as needed
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Price: $price',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Description: Add your description here...',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Add to cart functionality
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
