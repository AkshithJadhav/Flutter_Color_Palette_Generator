import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            height: 50,
            width: isExpanded ? 180 : 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 10),
              color: isExpanded ? Colors.green : Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(isExpanded ? Icons.check : Icons.shopping_cart),
                if (isExpanded)
                  const Text(
                    'Added to Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
