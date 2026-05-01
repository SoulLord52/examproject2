import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/consts/AppColors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: GoogleFonts.acme(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.mail, size: 24, color: AppColors.black,),
                SizedBox(width: 10),
                Text(
                  GetStorage().read("email"),
                  style: GoogleFonts.workSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColors.grey300,
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/change-password');
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.lock, size: 24, color: AppColors.black,),
                  SizedBox(width: 10),
                  Text(
                    "Change Password",
                    style: GoogleFonts.workSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
