import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.isPassword = false,
  });

  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? !isPasswordVisible : false,
      controller: widget.controller,
      cursorColor: Colors.blueAccent,
      cursorWidth: 2,
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
        suffixIconColor: Colors.black,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.workSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
