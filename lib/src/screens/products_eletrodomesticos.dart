import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_card.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_screen.dart';

class ElectrodomesticosScreen extends StatelessWidget {
  const ElectrodomesticosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProductScreen(
      category: 'Electrodomésticos',
      cards: <Widget>[
        SizedBox(height: 12),
        CustomProductCard(
          imagePath: 'assets/images/Electrodomesticos/lava.jpg',
          productName: 'Lavadora',
          price: '800.000',
        ),
        SizedBox(height: 24),
        CustomProductCard(
          imagePath: 'assets/images/Electrodomesticos/nevera.jpg',
          productName: 'Nevera',
          price: '1.500.000',
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
