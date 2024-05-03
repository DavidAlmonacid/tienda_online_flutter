import 'package:flutter/material.dart';

class AseoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png', width: 72, height: 79.2),
            SizedBox(height: 12),
            Text('Productos',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            SizedBox(height: 24),
            Text('ASEO', style: TextStyle(fontSize: 20)),
            SizedBox(height: 24),
            productCard('assets/detergente.png', 'Detergente', '20.000'),
            SizedBox(height: 24),
            productCard('assets/cepillo.png', 'Cepillo', '10.000'),
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(productName, style: TextStyle(fontSize: 16)),
              Text('\$ $price', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            // color: Theme.of(context).primaryColor,
            child: Text('Comprar'),
          ),
        ],
      ),
    );
  }
}
