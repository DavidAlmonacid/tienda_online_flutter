import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';
import 'package:tienda_online_flutter/src/widgets/custom_form_screen.dart';
import 'package:tienda_online_flutter/src/widgets/custom_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomFormScreen(
      title: 'Crear cuenta',
      form: Form(
        key: _formKey,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 120),
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
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
                  width: MediaQuery.of(context).size.width - 48,
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
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
                  text: 'Crear cuenta',
                  onPressed: _createAccount,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createAccount() async {
    final bool isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        CustomSnackBar.show(
          context: context,
          message: 'Cuenta creada exitosamente',
          error: false,
        );

        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Ocurrió un error. Por favor, inténtelo de nuevo.';

      if (e.code == 'invalid-email') {
        errorMessage = 'El correo electrónico no es válido.';
      } else if (e.code == 'weak-password') {
        errorMessage =
            'La contraseña es demasiado débil. Asegúrese de que tenga al menos 6 caracteres.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage =
            'El correo electrónico ya está en uso. Por favor, inicie sesión.';
      }

      CustomSnackBar.show(context: context, message: errorMessage, error: true);
    } catch (e) {
      CustomSnackBar.show(
        context: context,
        message: 'Ocurrió un error inesperado. Por favor, inténte más tarde.',
        error: true,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
