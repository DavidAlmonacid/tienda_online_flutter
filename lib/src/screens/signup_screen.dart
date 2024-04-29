import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_form_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomFormScreen(
      title: 'Crear cuenta',
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
            autofillHints: const [AutofillHints.newPassword],
            // obscureText: true,
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
        if (_formKey.currentState!.validate()) {
          // TODO: Implement sign up logic
        }
      },
      actionButtonText: 'Crear cuenta',
    );
  }
}
