import 'package:flutter/material.dart';
import '../config.dart';
import 'package:google_fonts/google_fonts.dart';

class GameButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const GameButton({required this.text, required this.onPressed, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: purple_a, // Purple fill
          side: BorderSide(color: yellow_a, width: 2), // Yellow border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: yellow_a,
                  ),
                ),
              ),
            ),
            Icon(Icons.play_arrow, size: 28, color: yellow_a),
          ],
        ),
      ),
    );
  }
}
