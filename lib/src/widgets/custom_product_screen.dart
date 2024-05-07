import 'package:flutter/material.dart';

class CustomProductScreen extends StatelessWidget {
  final String category;
  final List<Widget> cards;

  const CustomProductScreen({
    super.key,
    required this.category,
    required this.cards,
  });

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
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                category.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: cards,
            ),
          ),
        ],
      ),
    );
  }
}
