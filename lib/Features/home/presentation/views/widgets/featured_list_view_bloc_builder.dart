import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/maneger/featured_books_cubit/cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_list_view.dart';

class FeaturedBooksListViewBlocbuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocbuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocbuilder> createState() =>
      _FeaturedBooksListViewBlocbuilderState();
}

class _FeaturedBooksListViewBlocbuilderState
    extends State<FeaturedBooksListViewBlocbuilder> {
  final List<BookEntity> allBooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          allBooks.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState ||
            state is FeaturedBooksPaginationLoadingState ||
            state is FeaturedBooksPaginationFailureState) {
          return FeaturedBooksListView(
            books: allBooks,
          );
        } else if (state is FeaturedBooksFailureState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
