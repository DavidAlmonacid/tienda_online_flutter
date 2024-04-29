import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/screens/login_screen.dart';
import 'package:tienda_online_flutter/src/screens/signup_screen.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hogar Total - Tienda Online',
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    CustomAnimatedButton(
                      text: 'Iniciar sesión',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomAnimatedButton(
                      text: 'Crear cuenta',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
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
