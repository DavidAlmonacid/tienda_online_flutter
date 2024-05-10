import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_card.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_screen.dart';

class AseoScreen extends StatelessWidget {
  const AseoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProductScreen(
      category: 'Aseo',
      cards: <Widget>[
        SizedBox(height: 12),
        CustomProductCard(
          imagePath: 'assets/images/Aseo/detergente.png',
          productName: 'Detergente',
          price: 20000,
        ),
        SizedBox(height: 24),
        CustomProductCard(
          imagePath: 'assets/images/Aseo/cepillo.png',
          productName: 'Cepillo',
          price: 10000,
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
