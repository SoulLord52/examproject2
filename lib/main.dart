import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:examproject2/feature/homescreen/HomeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'feature/widget/AppRouter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())], child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = true;
  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isConnected = result != ConnectivityResult.none;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        primaryColor: Colors.blueAccent
      ),
      initialRoute: GetStorage().read("email") != null ? '/bottom-navigation' : '/login',
      debugShowCheckedModeBanner: false,
    );
  }
}
