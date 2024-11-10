import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // Light background color
        body: CoffeeOrderPage(),
      ),
    );
  }
}

class CoffeeOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background and image stack
        Container(
          // Dark brown background color
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: const BoxDecoration(
              color: Color(0xFF5E4335),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100))),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    Icon(Icons.favorite_border, color: Colors.white),
                  ],
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),

        // Content Stack
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE4B2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text("4.3", style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "\$25.40",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Cappuccino",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Coffee size", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),

                // Coffee size options
                Row(
                  children: [
                    CoffeeSizeOption(label: "Small", selected: true),
                    CoffeeSizeOption(label: "Medium"),
                    CoffeeSizeOption(label: "Large"),
                  ],
                ),

                const SizedBox(height: 20),

                // About section
                const Text(
                  "About",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "In comparison to a café latte, the perfect cappuccino has a more intense coffee flavor, as well as...",
                  style: TextStyle(color: Colors.grey),
                ),

                const Spacer(),

                // Volume and quantity
                Row(
                  children: [
                    const Text("Volume 160ml",
                        style: TextStyle(color: Colors.grey)),
                    const Spacer(),
                    QuantitySelector(),
                  ],
                ),

                const SizedBox(height: 20),

                // Buy now button
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E4335),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Buy now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 170,
          left: 113,
          child: Center(
            child: Container(
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-3, -3),
                      color: Colors.white12,
                      blurRadius: 3,
                      spreadRadius: 3),
                  BoxShadow(
                      offset: Offset(3, 3),
                      color: Colors.black,
                      blurRadius: 3,
                      spreadRadius: 3),
                ],
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/cofee2.png'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CoffeeSizeOption extends StatelessWidget {
  final String label;
  final bool selected;

  CoffeeSizeOption({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFFE4B2) : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? const Color(0xFF5E4335) : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.remove, color: Colors.grey),
        SizedBox(width: 10),
        Text("2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Icon(Icons.add, color: Colors.grey),
      ],
    );
  }
}
