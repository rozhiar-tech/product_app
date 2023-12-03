import 'package:flutter/material.dart';
import 'package:product_app/widgets/category_item.dart';
import 'package:product_app/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    ];

    return Scaffold(
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
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          name: products[index]['name'],
                          price: products[index]['price'],
                          imageUrl: products[index]['imageUrl'],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
