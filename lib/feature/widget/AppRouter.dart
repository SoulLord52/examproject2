import 'package:examproject2/feature/authentification/Login.dart';
import 'package:examproject2/feature/homescreen/HomeScreen.dart';
import 'package:examproject2/feature/settings/AboutScreen.dart';
import 'package:examproject2/feature/settings/AccountScreen.dart';
import 'package:examproject2/feature/settings/ChangePasswordScreen.dart';
import 'package:examproject2/feature/settings/SettingsScreen.dart';
import 'package:examproject2/feature/settings/TermsConditionsScreen.dart';
import 'package:examproject2/feature/widget/BottomNavigationBarWidget.dart';
import 'package:examproject2/feature/widget/NoPageFoundWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/model/NewsModel.dart';
import '../homescreen/HomeDetailsScreen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return onPageChange(HomeScreen());
      case '/login':
        return onPageChange(Login());
      case '/details':
        final model = settings.arguments as Article;
        return onPageChange(DetailScreen(model: model ));
      case '/settings':
        return onPageChange(SettingsScreen());
      case '/change-password':
        return onPageChange(ChangePasswordScreen());
      case '/terms':
        return onPageChange(TermsConditionsScreen());
      case '/account':
        return onPageChange(AccountScreen());
      case '/about':
        return onPageChange(AboutScreen());
      case '/bottom-navigation':
        return onPageChange(BottomNavigationBarWidget());
      default:
        return onPageChange(NoPageFoundScreen());
    }
  }

  static MaterialPageRoute onPageChange(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}