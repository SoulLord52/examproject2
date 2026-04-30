import 'package:examproject2/feature/authentification/Login.dart';
import 'package:examproject2/feature/settings/AboutScreen.dart';
import 'package:examproject2/feature/settings/AccountScreen.dart';
import 'package:examproject2/feature/settings/ChangePasswordScreen.dart';
import 'package:examproject2/feature/settings/TermsConditionsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.acme(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.person, size: 20, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    "Account",
                    style: GoogleFonts.workSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(CupertinoIcons.bell, size: 20, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "Push Notifications",
                  style: GoogleFonts.workSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.black,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsConditionsScreen()),
                );
              },
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.question_circle,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Terms & Conditions",
                    style: GoogleFonts.workSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              child: Row(
                children: [
                  Icon(CupertinoIcons.info, size: 20, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    "About",
                    style: GoogleFonts.workSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
            InkWell(
              onDoubleTap: () {
                GetStorage().remove("email");
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (_) => false);
              },
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.square_arrow_right,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Log out",
                    style: GoogleFonts.workSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
