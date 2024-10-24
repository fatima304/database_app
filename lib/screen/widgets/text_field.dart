import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController priceController;

  const CustomField({
    super.key,
    required this.labelText,
    required this.keyboardType,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: priceController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
