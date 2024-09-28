import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_events.dart';
import 'package:news_app/bloc/news_states.dart';
import 'package:news_app/core/category_list.dart';
import 'package:news_app/screens/widgets/list_wiget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller =
        TabController(length: CategoryList.categoryItems.length, vsync: this);
    print('this is when i am entering the screen for first time');
    BlocProvider.of<NewsBloc>(context)
        .add(CategoryEvents(category: CategoryList.categoryItems[0]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            child: TabBar(
              dividerColor: Colors.black,
              controller: controller,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              tabAlignment: TabAlignment.start,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (index) {
                BlocProvider.of<NewsBloc>(context).add(CategoryEvents(
                    category: CategoryList.categoryItems[index]));
                BlocProvider.of<NewsBloc>(context).state.categoryNewsList.clear();
                BlocProvider.of<NewsBloc>(context).categoryPage = 1;


              },
              unselectedLabelStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.black.withOpacity(.5),
              ),
              labelStyle: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),
              tabs: CategoryList.categoryItems
                  .map((category) => Tab(
                        text: category,
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: CategoryList.categoryItems.map((category) {
                return BlocBuilder<NewsBloc, NewsStates>(
                    builder: (context, state) {
                  if (state.categoryStatus == NewsStatus.loading && state.categoryNewsList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // else if (state.categoryStatus == NewsStatus.success) {
                  //   return NewsList(news: state.categoryNewsList);
                  // }
                  else if (state.categoryStatus == NewsStatus.error) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          state.categoryError,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else {
                    return NewsList(
                      news: state.categoryNewsList,
                      loadMore: () {
                        BlocProvider.of<NewsBloc>(context).add(CategoryEvents(category: category));
                      },
                    );
                  }
                });
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
