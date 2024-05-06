import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online_flutter/src/screens/login_screen.dart';
import 'package:tienda_online_flutter/src/screens/products_eletrodomesticos.dart';
import 'package:tienda_online_flutter/src/screens/selection_categories_screen.dart';
import 'package:tienda_online_flutter/src/screens/signup_screen.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';
import 'package:tienda_online_flutter/src/screens/products_aseo.dart';
import 'package:tienda_online_flutter/src/screens/products_mercado.dart';
import 'package:tienda_online_flutter/src/screens/products_muebles.dart';
import 'app_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: ((context, child) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hogar Total - Tienda Online',
      theme: ThemeData(fontFamily: 'RedHatDisplay'),
      home: Consumer<ApplicationState>(
        builder: (context, appState, child) {
          if (appState.loggedIn) {
            return const SelectionCategoriesScreen();
          } else {
            return const MainScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/categories': (context) => const SelectionCategoriesScreen(),
        '/products_aseo': (context) => const AseoScreen(),
        '/products_eletrodomesticos': (context) =>
            const ElectodomesticosScreen(),
        '/products_mercado': (context) => const MercadoScreen(),
        '/products_muebles': (context) => const MueblesScreen(),
      },
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
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomAnimatedButton(
                      text: 'Crear cuenta',
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
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
