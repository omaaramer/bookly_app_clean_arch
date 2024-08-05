import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.fetchNewestBooksUseCase})
      : super(FeaturedBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());

    var result = await fetchNewestBooksUseCase.call();
    //right side
    result.fold((failure) {
      emit(FeaturedBooksFailureState(message: failure.message));
    },
        // left side
        (books) {
      emit(FeaturedBooksSuccessState(books: books));
    });
  }
}
