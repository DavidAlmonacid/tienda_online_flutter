import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/screens/selection_categories_screen.dart';
import 'package:tienda_online_flutter/src/widgets/custom_form_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// https://firebase.google.com/docs/auth/flutter/password-auth

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomFormScreen(
      title: 'Iniciar sesión',
      formFields: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Correo electrónico',
              hintStyle: TextStyle(color: Colors.grey[500]),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 18),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su correo electrónico';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: TextStyle(color: Colors.grey[500]),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 18),
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const [AutofillHints.password],
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su contraseña';
              }
              return null;
            },
          ),
        ),
      ],
      onActionButtonPressed: () {
        // if (_formKey.currentState!.validate()) {}
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectionCategoriesScreen(),
          ),
        );
      },
      actionButtonText: 'Ingresar',
    );
  }
}
