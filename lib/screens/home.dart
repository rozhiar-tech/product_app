import 'package:flutter/material.dart';
import 'package:product_app/models/product_provider.dart';
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
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData(); // Call an asynchronous method without using await directly
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://172.20.10.9/connection.php'));
    if (response.statusCode == 200) {
      // Handle the response from the server
      print(response.body);
    } else {
      // Handle errors
      print('Request failed with status: ${response.statusCode}');
    }

    // Update the state when data fetching is complete
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedCategory = '';

    List<Map<String, dynamic>> products = [
      // Add your product details here
      {
        'name': 'Product 1',
        'price': '20',
        'imageUrl': 'assets/ww.png', // Replace with actual image URLs
      },
      {
        'name': 'Product 1',
        'price': '20',
        'imageUrl': 'assets/ww.png', // Replace with actual image URLs
      },
      // Add more product details as needed
      {
        'name': 'Product 1',
        'price': '20',
        'imageUrl': 'assets/ww.png', // Replace with actual image URLs
      },
    ];

    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Text(
                      "Blooms",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
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
                              title: 'Category 1',
                              onSelect: (value) {
                                selectedCategory = value;
                                print('Selected Category: $selectedCategory');
                              },
                            ),
                            CategoryItem(
                              title: 'Category 2',
                              onSelect: (value) {
                                selectedCategory = value;
                                print('Selected Category: $selectedCategory');
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
                            (products.length / 2).ceil(),
                            (index) => Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ProductItem(
                                      name: products[index * 2]['name'],
                                      price: products[index * 2]['price'],
                                      imageUrl: products[index * 2]['imageUrl'],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: (index * 2 + 1 < products.length)
                                        ? ProductItem(
                                            name: products[index * 2 + 1]
                                                ['name'],
                                            price: products[index * 2 + 1]
                                                ['price'],
                                            imageUrl: products[index * 2 + 1]
                                                ['imageUrl'],
                                          )
                                        : const SizedBox(), // For cases where the number of products is odd
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
