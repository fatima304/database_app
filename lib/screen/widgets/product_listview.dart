import 'package:design_app/screen/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({
    super.key,
    required this.products,
  });

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: products.isNotEmpty
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  name: products[index]['name'],
                  price: products[index]['price'],
                );
              },
            )
          : Center(
              child: Image.asset(
                'assets/nocart.png',
                width: 450,
                height: 450,
              ),
            ),
    );
  }
}
