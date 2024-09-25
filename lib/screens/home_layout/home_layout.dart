import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/core/extension.dart';
import 'package:news_app/screens/second_screen/second_screen.dart';

import 'home_layout_cubit/home_layout_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<HomeLayoutCubit>(context).changeThemeMode();
            },
            icon: Icon(context.watch<HomeLayoutCubit>().isDark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          ),
          // IconButton(
          //   onPressed: () {
          //     // TODO: App Router uses with extension
          //     // Navigator.of(context).pushNamed(AppStrings.secondScreen);
          //     // context.pushNamed(routeName: AppStrings.secondScreen );
          //
          //     // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SecondScreen(nameData: "")));
          //     context.push(widget: const SecondScreen(nameData: 'nameData'));
          //   },
          //   icon: const Icon(Icons.navigation_rounded),
          // ),
        ],
      ),
      body: const Center(
        child: Text("home Layout"),
      ),
    );
  }
}
