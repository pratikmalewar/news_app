import 'package:flutter/material.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/screens/home_layout/home_layout.dart';
import 'package:news_app/screens/second_screen/second_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_) =>  HomeLayout());

      case AppStrings.secondScreen:
        return MaterialPageRoute(builder: (_) =>  SecondScreen(nameData: '',));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text("${AppStrings.noRoutes} ${setting.name}"),
            ),
          ),
        );
    }
  }
}
