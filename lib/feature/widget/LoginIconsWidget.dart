import 'package:flutter/material.dart';

class RowLoginWidget extends StatefulWidget {
  const RowLoginWidget({super.key});

  @override
  State<RowLoginWidget> createState() => _RowLoginWidgetState();
}

class _RowLoginWidgetState extends State<RowLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Image.asset("assets/images/email_icon.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Image.asset("assets/images/google_icon.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Image.asset("assets/images/facebook_icon.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Image.asset("assets/images/twitter_icon.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Image.asset("assets/images/apple_icon.png"),
          ),
        ),
      ],
    );
  }
}
