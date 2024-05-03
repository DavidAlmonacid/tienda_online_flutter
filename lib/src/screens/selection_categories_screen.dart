import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectionCategoriesScreen extends StatefulWidget {
  const SelectionCategoriesScreen({super.key});

  @override
  _SelectionCategoriesScreenState createState() =>
      _SelectionCategoriesScreenState();
}

class _SelectionCategoriesScreenState extends State<SelectionCategoriesScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

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

                      // Return to the main screen
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text('Cerrar sesión'),
                  ),
                ],
              ),
            ),
            const Text('Selecciona una categoría',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  _buildCategoryItem(
                      'Aseo', 'assets/images/aseo.jpg', '/products_aseo'),
                  _buildCategoryItem('Electrodomesticos',
                      'assets/images/electrodomesticos.jpg', '/main6'),
                  _buildCategoryItem(
                      'Muebles', 'assets/images/muebles.png', '/main7'),
                  _buildCategoryItem(
                      'Mercado', 'assets/images/mercado.jpg', '/main8'),
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
      child: Column(
        children: <Widget>[
          Image.asset(imagePath, width: 172, height: 154, fit: BoxFit.fill),
          Text(title, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
