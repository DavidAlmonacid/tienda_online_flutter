import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';

class AseoScreen extends StatelessWidget {
  const AseoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.asset(
            'assets/images/logo.png',
            width: 50,
            height: 55,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 32),
          const Text(
            'Productos',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ASEO',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 12),
                _productCard(
                  'assets/images/Aseo/detergente.jpeg',
                  'Detergente',
                  '20.000',
                ),
                const SizedBox(height: 24),
                _productCard(
                  'assets/images/Aseo/cepillo.jpg',
                  'Cepillo',
                  '10.000',
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }

  Widget _productCard(String imagePath, String productName, String price) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(imagePath, width: 200, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(productName, style: const TextStyle(fontSize: 18)),
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomAnimatedButton(
              text: 'Comprar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
