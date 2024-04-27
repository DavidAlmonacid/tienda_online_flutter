import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_form_screen.dart';

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
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Correo electrónico'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese su correo electrónico';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Contraseña'),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese su contraseña';
            }
            return null;
          },
        ),
      ],
      onActionButtonPressed: () {
        if (_formKey.currentState!.validate()) {
          // Lógica de inicio de sesión
        }
      },
      actionButtonText: 'Ingresar',
    );
  }
}
