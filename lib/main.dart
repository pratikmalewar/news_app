import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_router.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/core/bloc_observer.dart';
import 'package:news_app/core/cache_data.dart';
import 'package:news_app/di.dart';
import 'package:news_app/screens/home_layout/home_layout.dart';
import 'package:news_app/screens/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:news_app/screens/home_layout/home_layout_cubit/home_layout_states.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await SharedData.init();
 await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: 'News App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: context
                .watch<HomeLayoutCubit>()
                .isDark ? ThemeMode.dark : ThemeMode.light,
            // home: const HomeLayout(),
            onGenerateRoute: AppRouter().onGenerateRoute,
            initialRoute: AppStrings.layout,
          );
        },
      ),
    );
  }
}
