import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_events.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/di.dart';
import 'package:news_app/screens/home_layout/home_layout.dart';
import 'package:news_app/screens/second_screen/second_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => sl<NewsBloc>()..add(HomeEvents()),
              child: HomeLayout(),
            ));

      case AppStrings.secondScreen:
        return MaterialPageRoute(builder: (_) => SecondScreen(nameData: '',));
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Text("${AppStrings.noRoutes} ${setting.name}"),
                ),
              ),
        );
    }
  }
}
