import 'package:examproject2/feature/homescreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/consts/AppColors.dart';
import '../widget/AppButonWidget.dart';
import '../widget/AppRouter.dart';
import '../widget/CustomInputWidget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.27,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "             Enter your email\nto be sent a reset password link.",
              style: GoogleFonts.workSans(
                fontSize: 18,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            CustomInputWidget(
              controller: emailController,
              labelText: 'Enter your email!',
            ),
            SizedBox(height: 50),
            AppButton(
              text: 'Reset',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouter.forgotPassword,
                  (_) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
