import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // For form validation

  // Text editing controller variables for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'), // Title for the screen
      ),
      body: SingleChildScrollView(
        // Allow scrolling if content overflows
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            children: [
              // Text field for email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                validator: (value) {
                  return null;

                  // Add validation logic for email (if needed)
                },
              ),
              const SizedBox(height: 20.0), // Add spacing

              // Text field for password
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true, // Hide password characters
                validator: (value) {
                  return null;

                  // Add validation logic for password (if needed)
                },
              ),
              const SizedBox(height: 20.0),

              // Button to submit login
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login logic (call equivalent of `ingresarUsuario` from Kotlin)
                  }
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
