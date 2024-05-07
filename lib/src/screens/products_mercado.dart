import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_card.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_screen.dart';

class MercadoScreen extends StatelessWidget {
  const MercadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProductScreen(
      category: 'Mercado',
      cards: <Widget>[
        SizedBox(height: 12),
        CustomProductCard(
          imagePath: 'assets/images/Mercado/arroz.jpg',
          productName: 'Arroz',
          price: '3.000',
        ),
        SizedBox(height: 24),
        CustomProductCard(
          imagePath: 'assets/images/Mercado/uvas.jpeg',
          productName: 'Uvas',
          price: '5.000',
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
