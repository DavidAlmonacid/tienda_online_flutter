import 'package:flutter/material.dart';

class MercadoScreen extends StatelessWidget {
  const MercadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png', width: 72, height: 79.2),
            const SizedBox(height: 12),
            const Text('Productos',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            const SizedBox(height: 24),
            const Text('MERCADO', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            productCard('assets/images/Mercado/arroz.jpg', 'Arroz', '3.000'),
            const SizedBox(height: 24),
            productCard('assets/images/Mercado/uvas.jpeg', 'Uvas', '5.000'),
          ],
        ),
      ),
    );
  }

  Widget productCard(String imagePath, String productName, String price) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(imagePath, width: 203, height: 134, fit: BoxFit.fill),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(productName, style: const TextStyle(fontSize: 16)),
              Text('\$ $price', style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            // color: Theme.of(context).primaryColor,
            child: const Text('Comprar'),
          ),
        ],
      ),
    );
  }
}
