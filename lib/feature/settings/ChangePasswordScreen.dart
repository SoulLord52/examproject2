import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/consts/AppColors.dart';
import '../widget/CustomInputWidget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: GoogleFonts.acme(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text(
              "SAVE",
              style: GoogleFonts.workSans(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomInputWidget(
              labelText: 'Write current password!',
              isPassword: true,
            ),
            SizedBox(height: 15),
            CustomInputWidget(labelText: 'Write new password'),
            SizedBox(height: 15),
            CustomInputWidget(labelText: 'Confirm new password'),
          ],
        ),
      ),
    );
  }
}
