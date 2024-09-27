import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_states.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/data/news_modal.dart';

class NewsList extends StatefulWidget {
  final List<NewsModal> news;
  final Function() loadMore;

  NewsList({
    super.key,
    required this.news,
    required this.loadMore,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final controller = ScrollController();

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      print("the last position of the screen");
      widget.loadMore();
    } else {
      print("it is not last position");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: widget.news.length,
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage("${widget.news[index].urlTOImage}"),
                fit: BoxFit.fill,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                // borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "${widget.news[index].title}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
