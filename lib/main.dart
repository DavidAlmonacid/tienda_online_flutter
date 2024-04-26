import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:tienda_online_flutter/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 130.8,
                ),
              ),
              const SizedBox(height: 320),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: <Widget>[
                    AnimatedButton(
                      onPress: () async {
                        // Inicia la animación
                        print('Botón presionado');
                        // Espera un tiempo determinado. Por ejemplo, 500 milisegundos
                        await Future.delayed(const Duration(milliseconds: 700));
                        // Después del retraso, navega a la siguiente pantalla
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      height: 48,
                      width: 300,
                      text: 'Iniciar sesión',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      backgroundColor: Colors.cyan[900]!,
                      borderColor: Colors.white,
                      borderRadius: 50,
                      borderWidth: 2,
                    ),
                    const SizedBox(height: 20),
                    AnimatedButton(
                      onPress: () async {
                        // Inicia la animación
                        print('Botón presionado');
                        // Espera un tiempo determinado. Por ejemplo, 500 milisegundos
                        await Future.delayed(const Duration(milliseconds: 700));
                        // Después del retraso, navega a la siguiente pantalla
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThirdScreen()),
                        );
                      },
                      height: 48,
                      width: 300,
                      text: 'Crear cuenta',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.RIGHT_TO_LEFT,
                      backgroundColor: Colors.cyan[900]!,
                      borderColor: Colors.white,
                      borderRadius: 50,
                      borderWidth: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: const Center(
        child: Text("Welcome to the second screen!"),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: const Center(
        child: Text("Welcome to the third screen!"),
      ),
    );
  }
}
