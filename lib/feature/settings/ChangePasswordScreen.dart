import 'package:examproject2/feature/homescreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          "Account",
          style: GoogleFonts.acme(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
            child: Text("SAVE",
            style: GoogleFonts.workSans(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
          ),
          SizedBox(width: 10,),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 24,
            color: Colors.black,
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
