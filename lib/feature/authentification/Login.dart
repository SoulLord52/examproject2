import 'package:examproject2/feature/widget/LoginIconsWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/consts/AppColors.dart';
import '../widget/AppButonWidget.dart';
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
              height: MediaQuery.of(context).size.height * 0.30,
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
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.workSans(color: AppColors.black, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 80),
            AppButton(
              text: 'Sign In',
              onPressed: () {
                box.write('email', emailController.text);
                Navigator.pushNamedAndRemoveUntil(context, '/bottom-navigation', (_) => false);
              },
            ),
            SizedBox(height: 15,),
            Divider(),
            SizedBox(height: 15,),
            RowLoginWidget(),
            Spacer(),
            Text("By signing up to News24 you are accepting our", style: GoogleFonts.workSans(fontSize: 16, color: Colors.black),),
            TextButton(onPressed: () {Navigator.pushNamed(context, '/terms');}, child:  Text("Terms & Conditions", textAlign: TextAlign.center, style: GoogleFonts.workSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),),
          ],
        ),
      ),
    );
  }
}
