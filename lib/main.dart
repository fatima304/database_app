import 'package:design_app/screen/product_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Productapp(),
  );
}

class Productapp extends StatelessWidget {
  const Productapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}
