import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailScreen(),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Blue Section
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: const Color(0xFF4A90E2), // Blue background color
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Navigation Row
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    Icon(Icons.shopping_cart, color: Colors.white, size: 28),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Title and Price
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aristocratic Hand Bag",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Red Stylish Bag",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Price",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "\$234",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // White Container with Rounded Top Corners
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bag Image (Replace this with your own image asset)

                      const SizedBox(height: 40),
                      // Color and Size Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Color",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xFFDBDEE4),
                                  ),
                                  SizedBox(width: 8),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xFF4A90E2),
                                  ),
                                  SizedBox(width: 8),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xFFFBADC6),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "12 cm",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Description
                      Text(
                        "Stylish Bags designed to complement every occasion. From trendy totes to chic clutches, each bag combines elegance with functionality, catering to every style. Our bags have set the standard for quality and style, capturing the essence of timeless design. Discover the charm of our curated collections that elevate any wardrobe effortlessly.",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                      // Quantity Selector and Favorite Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              const Text(
                                "01",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite,
                              color: Colors.red, size: 28),
                        ],
                      ),
                      const Spacer(),
                      // Buy Now Button
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A90E2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "BUY NOW",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 200,
            left: 150,
            child: Container(
              width: 270,
              height: 270,
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/images/1.png', // Placeholder image path
                height: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
