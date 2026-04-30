import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: Size(150, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.acme(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
