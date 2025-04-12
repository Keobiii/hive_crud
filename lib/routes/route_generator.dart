import 'package:flutter/material.dart';
import 'package:hive_crud/screens/LoginScreen.dart';
import 'package:hive_crud/screens/SignUpScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('No Route'), centerTitle: true),
          body: const Center(
            child: Text(
              'Sorry route not found',
              style: TextStyle(color: Colors.red, fontSize: 18.0),
            ),
          ),
        );
      },
    );
  }
}
