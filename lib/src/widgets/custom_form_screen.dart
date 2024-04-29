import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/src/widgets/custom_animated_button.dart';

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
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
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
              width: MediaQuery.of(context).size.width - 48,
              child: CustomAnimatedButton(
                text: actionButtonText,
                onPressed: onActionButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
