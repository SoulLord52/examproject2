import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/consts/AppColors.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: GoogleFonts.workSans(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black,),),
        Spacer(),
        TextButton(
          child: Text('See all', style: GoogleFonts.acme(fontSize: 16, color: AppColors.blueAccent, fontWeight: FontWeight.bold),),
          onPressed: () {},
        )
      ],
    );
  }
}