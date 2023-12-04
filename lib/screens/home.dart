import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_app/models/product_provider.dart';
import 'package:product_app/screens/cart.dart';
import 'package:product_app/widgets/category_item.dart';
import 'package:product_app/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<Map<String, dynamic>> products = [];
  late TextEditingController searchController;
  List<Map<String, dynamic>> filteredProducts = [];
  List<Map<String, dynamic>> filteredCategoryProducts = [];
  String selectedCategory = '';
  int cartItemCount = 0;
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    fetchData();
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      filteredCategoryProducts = products
          .where((product) => product['category']
              .toLowerCase()
              .contains(category.toLowerCase()))
          .toList();
      print(filteredCategoryProducts);
    });
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems),
      ),
    );
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://172.20.10.9/server/get.php'));
    if (response.statusCode == 200) {
      List<dynamic> parsedJson = json.decode(response.body);

      parsedJson.forEach((product) {
        Map<String, dynamic> productData = {
          'name': product['name'],
          'price': product['price'],
          'imageUrl': product['imagUrl'],
          'description': product['description'],
          'id': product['id'],
          'category': product['category'],
        };
        products.add(productData);
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Request failed with status: ${response.statusCode}'),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextField(
            controller: searchController,
            onChanged: (value) {
              filterProducts(value);
            },
            decoration: InputDecoration(
              hintText: 'Search Products...',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                  filterProducts('');
                },
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Blooms",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () => navigateToCartPage(),
                              icon: Icon(
                                Icons.shop,
                                size: 40,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: -2,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 7,
                                  minHeight: 7,
                                ),
                                child: Center(
                                  child: Text(
                                    cartItemCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Text(
                            "Most Popular Items",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  right: 12,
                                ),
                                padding: const EdgeInsets.all(8),
                                height: MediaQuery.sizeOf(context).height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple,
                                      Colors.black,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Get Your Black Friday Deal Now",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Image.asset("assets/ww.png")
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Text(
                            "Discover New Products",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // R categories
                        Row(
                          children: [
                            CategoryItem(
                              title: 'luxury',
                              onSelect: (value) {
                                filterByCategory('luxury');
                              },
                              onDeselect: () {
                                filterByCategory("");
                              },
                            ),
                            CategoryItem(
                              title: 'cars',
                              onSelect: (value) {
                                filterByCategory('cars');
                              },
                              onDeselect: () {
                                filterByCategory("");
                              },
                            ),
                            CategoryItem(
                              title: 'skin',
                              onSelect: (value) {
                                filterByCategory(value);
                              },
                              onDeselect: () {
                                filterByCategory("");
                              },
                            ),
                            CategoryItem(
                              title: 'electronics',
                              onSelect: (value) {
                                filterByCategory(value);
                              },
                              onDeselect: () {
                                filterByCategory("");
                              },
                            ),
                            CategoryItem(
                              title: 'children',
                              onSelect: (value) {
                                filterByCategory('children');
                              },
                              onDeselect: () {
                                filterByCategory("");
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                            filteredCategoryProducts.isNotEmpty
                                ? filteredCategoryProducts.length
                                : (searchController.text.isNotEmpty)
                                    ? filteredProducts.length
                                    : products.length.ceil(),
                            (index) => Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ProductItem(
                                      onAddToCart: () {
                                        setState(() {
                                          cartItemCount++;

                                          cartItems.add(filteredCategoryProducts
                                                  .isNotEmpty
                                              ? filteredCategoryProducts[index]
                                              : (searchController
                                                      .text.isNotEmpty)
                                                  ? filteredProducts[index]
                                                  : products[index]);
                                        });
                                      },
                                      name: filteredCategoryProducts.isNotEmpty
                                          ? filteredCategoryProducts[index]
                                              ['name']
                                          : (searchController.text.isNotEmpty)
                                              ? filteredProducts[index]['name']
                                              : products[index]['name'],
                                      price: filteredCategoryProducts.isNotEmpty
                                          ? filteredCategoryProducts[index]
                                              ['price']
                                          : (searchController.text.isNotEmpty)
                                              ? filteredProducts[index]['price']
                                              : products[index]['price'],
                                      imageUrl: filteredCategoryProducts
                                              .isNotEmpty
                                          ? filteredCategoryProducts[index]
                                              ['imageUrl']
                                          : (searchController.text.isNotEmpty)
                                              ? filteredProducts[index]
                                                  ['imageUrl']
                                              : products[index]['imageUrl'],
                                      description: filteredCategoryProducts
                                              .isNotEmpty
                                          ? filteredCategoryProducts[index]
                                              ['description']
                                          : (searchController.text.isNotEmpty)
                                              ? filteredProducts[index]
                                                  ['description']
                                              : products[index]['description'],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
