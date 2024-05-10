import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_card.dart';
import 'package:tienda_online_flutter/src/widgets/custom_product_screen.dart';

class MueblesScreen extends StatelessWidget {
  const MueblesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProductScreen(
      category: 'Muebles',
      cards: <Widget>[
        SizedBox(height: 12),
        CustomProductCard(
          imagePath: 'assets/images/Muebles/sofa.png',
          productName: 'Sofá',
          price: 600000,
        ),
        SizedBox(height: 24),
        CustomProductCard(
          imagePath: 'assets/images/Muebles/escritorio.png',
          productName: 'Escritorio',
          price: 400000,
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
