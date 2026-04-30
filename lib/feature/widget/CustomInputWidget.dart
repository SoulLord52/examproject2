import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/consts/AppColors.dart';

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
      cursorColor: AppColors.blueAccent,
      cursorWidth: 2,
      cursorErrorColor: AppColors.red,
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
        suffixIconColor: AppColors.black,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.workSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.grey,
        ),
        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey,)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey,),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black,),
        ),
      ),
    );
  }
}
