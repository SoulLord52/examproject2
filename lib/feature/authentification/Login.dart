import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/AppButonWidget.dart';
import '../widget/AppRouter.dart';
import '../widget/CustomInputWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  final box = GetStorage();
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
              height: MediaQuery.of(context).size.height * 0.29,
              width: MediaQuery.of(context).size.width * 0.29,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomInputWidget(
                controller: emailController,
                labelText: 'Enter your email!',
              ),
            ),
            CustomInputWidget(
              controller: passwordController,
              labelText: 'Enter your password!',
              isPassword: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.forgotPassword);
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.workSans(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 100),
            AppButton(
              text: 'Sign In',
              onPressed: () {
                box.write('email', emailController.text);
                Navigator.pushNamedAndRemoveUntil(context, AppRouter.home, (_) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
