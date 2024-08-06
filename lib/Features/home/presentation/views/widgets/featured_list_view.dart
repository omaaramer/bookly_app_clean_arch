import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../maneger/featured_books_cubit/cubit/featured_books_cubit.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;

  const FeaturedBooksListView({super.key, required this.books});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  @override
  Widget build(BuildContext context) {
    // Create a ScrollController
    late final ScrollController _scrollController;
    var nextPage = 1;
    var isLoading = false;
    // Function to handle scroll events
    void handleScroll() async {
      double currentPosition = _scrollController.position.pixels;
      double maxExtent = _scrollController.position.maxScrollExtent;

      // Calculate when the list view reaches 70% of its length
      if (maxExtent > 0 && currentPosition >= maxExtent * 0.7) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
            pageNum: nextPage++,
          );
          isLoading = false;
        }
      }
    }

    @override
    void initState() {
      super.initState();
      _scrollController = ScrollController();
      // Add a listener to the scroll controller
      _scrollController.addListener(handleScroll);
    }

    @override
    void dispose() {
      // Dispose the scroll controller when the widget is removed
      _scrollController.dispose();
      super.dispose();
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(image: widget.books[index].imageUrl ?? ''),
          );
        },
      ),
    );
  }
}
