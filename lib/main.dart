import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:tienda_online_flutter/src/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'RedHatDisplay'),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);

    // Inicia la animación
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 40,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: 130.8,
                      ),
                    );
                  },
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

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: const Center(
        child: Text("¡Bienvenido a la tercera pantalla!"),
      ),
    );
  }
}
