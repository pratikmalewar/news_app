import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_states.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/screens/widgets/list_wiget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      builder: (context, state) {
        // final news = context.watch<NewsBloc>().news;
        if (state.homeStatus == NewsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.homeStatus == NewsStatus.error) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                state.homeError,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
        return SingleChildScrollView(child: NewsList(news: state.homeNewsList),);
      },
    );
  }
}
