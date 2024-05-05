import 'package:flutter/material.dart';

class CustomFormScreen extends StatelessWidget {
  final String title;
  final Form form;

  const CustomFormScreen({
    super.key,
    required this.title,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 60),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: form,
            ),
          ),
        ],
      ),
    );
  }
}
