import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/core/extension.dart';
import 'package:news_app/screens/category/category_screen.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/second_screen/second_screen.dart';

import 'home_layout_cubit/home_layout_cubit.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  final PageController pageController = PageController();

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
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
        },
        children: [
          HomeScreen(),
          CategoryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<HomeLayoutCubit>().currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (int index) {

          context.read<HomeLayoutCubit>().changeNavBar(index: index);
          pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
            tooltip: AppStrings.home,
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: AppStrings.category,
            tooltip: AppStrings.category,
            activeIcon: Icon(Icons.category_outlined),
          ),
        ],
      ),
    );
  }
}
