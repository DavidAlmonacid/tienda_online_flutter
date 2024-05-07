import 'package:flutter/material.dart';

class ElectrodomesticosScreen extends StatelessWidget {
  const ElectrodomesticosScreen({super.key});

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
            const Text('ELECTRODOMESTICOS', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            productCard('assets/images/Electrodomesticos/lava.jpg', 'Lavadora',
                '800.000'),
            const SizedBox(height: 24),
            productCard('assets/images/Electrodomesticos/nevera.jpg', 'Nevera',
                '1.500.000'),
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
