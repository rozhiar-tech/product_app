import 'package:flutter/material.dart';
import 'package:product_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  String selectedCategory = '';
  List<Product> products = [];

  void updateCategory(String category) {
    selectedCategory = category;
    
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    // Simulating fetching products from a data source, like an API
    // Example:
    final fetchedProducts = await callData();

    debugPrint('Products before adding fetched data: $products');
    products.addAll(fetchedProducts);
    debugPrint('Products after adding fetched data: $products');

    notifyListeners();
  }

  Future<List<Product>> callData() async {
    // This function could represent an actual API call
    // Implement your logic to fetch products here
    return [
      Product(
        name: 'Product 1',
        price: '20',
        imageUrl: 'assets/ww.png',
      ),
      Product(
        name: 'Product 2',
        price: '30',
        imageUrl: 'assets/ww.png',
      ),
      // Add more products as needed
    ];
  }
}
