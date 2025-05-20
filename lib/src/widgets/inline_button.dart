import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config.dart';

class InlineButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const InlineButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        foregroundColor: yellow_a, // Sets the text/icon color
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.orbitron(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: yellow_a,
        ),
      ),
    );
  }
}
