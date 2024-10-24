import 'package:design_app/Helpers/sqlite.dart';
import 'package:design_app/screen/widgets/custom_button.dart';
import 'package:design_app/screen/widgets/product_listview.dart';
import 'package:design_app/screen/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Map<String, dynamic>> products = [];
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayProducts();
  }

  Future<void> displayProducts() async {
    final data = await DatabaseHelper().getProducts();
    setState(() {
      products = data;
    });
  }

  Future<void> addProduct() async {
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text);

    if (name.isNotEmpty && price != null) {
      await DatabaseHelper().insertProduct(name, price);
      _nameController.clear();
      _priceController.clear();
      displayProducts();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid name and price')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 71, 164, 75),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.green[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CustomField(
                    labelText: 'Name',
                    priceController: _nameController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(width: 10),
                  CustomField(
                    labelText: 'Price',
                    priceController: _priceController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    onPressed: addProduct,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomListview(products: products),
          ],
        ),
      ),
    );
  }
}
