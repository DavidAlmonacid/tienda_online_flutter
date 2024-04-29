import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class CustomAnimatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomAnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: () async {
        await Future.delayed(const Duration(milliseconds: 600));
        onPressed();
      },
      height: 50,
      width: MediaQuery.of(context).size.width - 48,
      text: text,
      textStyle: const TextStyle(
        fontFamily: 'RedHatDisplay',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.LEFT_TO_RIGHT,
      backgroundColor: Colors.cyan[900]!,
      borderColor: Colors.blueGrey[700]!,
      borderRadius: 50,
      borderWidth: 2,
    );
  }
}
