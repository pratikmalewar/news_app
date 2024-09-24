import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home_layout_cubit/home_layout_cubit.dart';

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
            icon:  Icon(context.watch<HomeLayoutCubit>().isDark?Icons.dark_mode_outlined :Icons.light_mode_outlined),
          )
        ],
      ),
      body: const Center(
        child: Text("home Layout"),
      ),
    );
  }
}
