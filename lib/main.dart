import 'package:examproject2/feature/authentification/Login.dart';
import 'package:examproject2/feature/homescreen/HomeCubit.dart';
import 'package:examproject2/feature/homescreen/HomeScreen.dart';
import 'package:examproject2/feature/widget/BottomNavigationBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())], child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        primaryColor: Colors.blueAccent
      ),
      home: GetStorage().read('email') != null ? Bottomnavigationbarwidget() : Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
