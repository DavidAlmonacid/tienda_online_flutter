import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tienda_online_flutter/src/widgets/custom_snack_bar.dart';

class CustomProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  const CustomProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath, width: 200, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(productName, style: const TextStyle(fontSize: 18)),
              Text(
                '\$ $price',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomAnimatedButton(
            text: 'Comprar',
            onPressed: () {
              _comprarProducto(productName, double.parse(price));
            },
          ),
        ],
      ),
    );
  }

  // Create a function "_comprarProducto" that receives two parameters: a name of type string and a price of type double.
  // help me create the function in the following line
  void _comprarProducto(String name, double price) {
    final db = FirebaseFirestore.instance;

    final producto = <String, dynamic>{
      'nombre': name,
      'precio': price,
      'fecha': DateTime.now(),
    };

    /*
    db.collection("compras")
            .add(producto)
            .addOnSuccessListener { documentReference ->
                // Manejar el éxito del envío de datos si es necesario
                Funciones.mostrarAlerta("Su compra de $nombre fue exitosa", this)
            }
            .addOnFailureListener { e ->
                // Manejar el error si ocurre
                Funciones.mostrarAlerta("Error al comprar el $nombre", this)
            }
    */
    // Help me to create the code to add the product to the "compras" collection in Firestore, and translate the commented Kotlin code to Dart.

    db.collection('compras').add(producto).then((DocumentReference doc) {
      // Manejar el éxito del envío de datos si es necesario
      CustomSnackBar.show(context: context, message: 'Su compra de $name fue exitosa',);
    }).catchError((error) {
      // Manejar el error si ocurre
      CustomSnackBar.show(context: context, message: 'Error al comprar el $name', error: true,);
    });
  }

}
