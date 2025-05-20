
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
      child:
    ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
              backgroundColor: purple_a, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24), // Optional: Bigger button
            ),
      child: Row(
                //mainAxisSize: MainAxisSize.min,
               children: [
            // Left-aligned text
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
            // Right-aligned icon
            Icon(Icons.play_arrow, size: 28, color: yellow_a),
          ],
              ),
      ),
    );
  }
}

