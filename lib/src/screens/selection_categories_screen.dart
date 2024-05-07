import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectionCategoriesScreen extends StatefulWidget {
  const SelectionCategoriesScreen({super.key});

  @override
  _SelectionCategoriesScreenState createState() =>
      _SelectionCategoriesScreenState();
}

class _SelectionCategoriesScreenState extends State<SelectionCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/images/logo.png', width: 60, height: 66),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan[300],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Cerrar sesión',
                      style: TextStyle(color: Color(0xFF2B3F4E)),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Selecciona una categoría',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 40),
                  _buildCategoryItem(
                    'Aseo',
                    'assets/images/aseo.jpg',
                    '/products_aseo',
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    'Electrodomésticos',
                    'assets/images/electrodomesticos.jpg',
                    '/products_eletrodomesticos',
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    'Muebles',
                    'assets/images/muebles.png',
                    '/products_muebles',
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    'Mercado',
                    'assets/images/mercado.jpg',
                    '/products_mercado',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath, String routeName) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(imagePath, width: 172, height: 154, fit: BoxFit.fill),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
