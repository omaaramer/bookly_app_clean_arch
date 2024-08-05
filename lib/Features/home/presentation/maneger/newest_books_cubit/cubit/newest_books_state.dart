part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksFailureState extends NewestBooksState {
  final String message;
  const NewestBooksFailureState({required this.message});
}

final class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksSuccessState({required this.books});
}
