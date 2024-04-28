import 'package:flutter/material.dart';

class CustomFormScreen extends StatelessWidget {
  final String title;
  final List<Widget> formFields;
  final VoidCallback onActionButtonPressed;
  final String actionButtonText;

  const CustomFormScreen({
    super.key,
    required this.title,
    required this.formFields,
    required this.onActionButtonPressed,
    required this.actionButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Stack(
        // padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Column(
            children: [
              const SizedBox(height: 60),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 120),
              ...formFields,
            ],
          ),
          Positioned(
            bottom: 44,
            child: ElevatedButton(
              onPressed: onActionButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[900],
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontFamily: 'RedHatDisplay',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text(actionButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
