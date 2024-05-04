import 'package:flutter/material.dart';

class AseoScreen extends StatelessWidget {
  const AseoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 50,
            height: 55,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 12),
            const Text('Productos',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            const SizedBox(height: 24),
            const Text('ASEO', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            productCard(
                'assets/images/Aseo/detergente.jpeg', 'Detergente', '20.000'),
            const SizedBox(height: 24),
            productCard('assets/images/Aseo/cepillo.jpg', 'Cepillo', '10.000'),
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
