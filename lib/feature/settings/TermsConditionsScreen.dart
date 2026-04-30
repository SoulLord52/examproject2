import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/consts/AppColors.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.acme(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 24,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Paragraph 1",
                style: GoogleFonts.acme(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis quis venenatis, diam leo. Sed bibendum ac dui condimentum consequat tempus vel sit. Lectus sit tristique in nullam vitae sed feugiat. Aliquet diam elit mus viverra. Neque, molestie morbi cursus amet pellentesque aenean posuere nascetur. Eu risus id ultricies est. Ac, faucibus pellentesque ullamcorper amet diam varius interdum.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.workSans(
                  fontSize: 16,
                  height: 1.5,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Paragraph 2",
                style: GoogleFonts.acme(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sit in vitae semper egestas sed posuere tellus nisl diam. Ipsum, nisl aenean fusce a, ut cras varius et. Enim egestas tempus velit molestie odio in aliquet. Orci gravida ac faucibus et eu phasellus elit, tellus. Dictum lacinia massa in amet elit. Felis magna et dis adipiscing porttitor sed. Fringilla ante lacus fermentum, ultricies volutpat neque, aliquet. Cras leo, porttitor tellus mi in. Nec volutpat in sed consequat pharetra tristique pulvinar sit. Id commodo tristique tellus in fringilla scelerisque mauris. Mauris quam euismod sit viverra a dictumst arcu sed laoreet. Volutpat bibendum amet diam semper. Nunc tellus eu auctor tellus vivamus a. Euismod orci, ut consequat consectetur praesent quis euismod id.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.workSans(
                  fontSize: 18,
                  height: 1.5,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
