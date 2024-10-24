import 'package:design_app/screen/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;

  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.shopping_bag,
                color: Colors.green,
                size: 25,
              ),
            ),
            const SizedBox(width: 20),
            ProductWidget(name: name, price: price),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.green[700],
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
