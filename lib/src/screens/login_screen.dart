import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';
import 'package:tienda_online_flutter/src/widgets/custom_form_screen.dart';
import 'package:tienda_online_flutter/src/widgets/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;
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
      form: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
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
            const SizedBox(height: 80),
            CustomAnimatedButton(
              text: 'Ingresar',
              onPressed: _signin,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signin() async {
    final bool isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    //setState(() {
    //   _isLoading = true;
    //});
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());

      if (userCredential.user != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/categories', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Ocurrió un error. Por favor, inténtelo de nuevo.';

      if (e.code == 'user-not-found') {
        errorMessage = 'No se encontro un usuario con ese correo electrónico';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Contraseña incorrecta';
      }

      CustomSnackBar.show(context: context, message: errorMessage, error: true);
    } catch (e) {
      CustomSnackBar.show(
        context: context,
        message: 'Ocurrió un error inesperado. Por favor, inténte más tarde.',
        error: true,
      );
    }
    //finally {
    //setState(() {
    // _isLoading = false;
    //});
    //}
  }
}
