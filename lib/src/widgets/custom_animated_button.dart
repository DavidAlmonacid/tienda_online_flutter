import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomAnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  _CustomAnimatedButtonState createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedButton(
            onPress: widget.isLoading
                ? null
                : () async {
                    await Future.delayed(const Duration(milliseconds: 600));
                    if (!mounted) return;
                    widget.onPressed();
                  },
            height: 50,
            width: MediaQuery.of(context).size.width - 48,
            text: widget.isLoading ? '' : widget.text,
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
          ),
          if (widget.isLoading)
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            ),
        ],
      ),
    );
  }
}
