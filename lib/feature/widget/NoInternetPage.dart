import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset('assets/lottie/nointernet.json',width: 80,height: 80,),
            SizedBox(height: 5),
            Text('No Internet connection please check your mobile !',style: GoogleFonts.workSans(fontWeight: FontWeight.w600,fontSize: 14),)
          ],
        ),
      ),
    );
  }
}