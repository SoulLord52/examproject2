import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:examproject2/feature/homescreen/HomeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'feature/widget/AppRouter.dart';
final GlobalKey<NavigatorState> _key = GlobalKey();
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
      if (result.contains(ConnectivityResult.none)) {
        Navigator.pushNamed(_key.currentContext!, '/no_internet');
      }else{
        Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _key,
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
