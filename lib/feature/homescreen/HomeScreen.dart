import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/title.png",
          height: MediaQuery.of(context).size.height * 0.26,
          width: MediaQuery.of(context).size.width * 0.26,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        actions: [
          Icon(CupertinoIcons.bell, size: 24),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [

      ],
      ),
    );
  }
}
