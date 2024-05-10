import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final int price;

  const CustomProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                NumberFormat.currency(
                  locale: 'es_CO',
                  decimalDigits: 0,
                  symbol: '\$',
                  customPattern: '\u00A4 ###,##0',
                ).format(price),
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
            onPressed: () {
              final database = FirebaseFirestore.instance;
              final product = {'nombre': productName, 'precio': price};

              database.collection('compras').add(product).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Compra exitosa'),
                  ),
                );
              }).catchError((e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error al comprar'),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
