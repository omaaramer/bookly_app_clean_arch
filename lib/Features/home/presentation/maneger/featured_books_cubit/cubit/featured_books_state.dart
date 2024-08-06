part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoadingState extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

final class FeaturedBooksPaginationFailureState extends FeaturedBooksState {
  final String message;
  const FeaturedBooksPaginationFailureState({required this.message});
}

final class FeaturedBooksFailureState extends FeaturedBooksState {
  final String message;
  const FeaturedBooksFailureState({required this.message});
}

final class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;
  const FeaturedBooksSuccessState({required this.books});
}
