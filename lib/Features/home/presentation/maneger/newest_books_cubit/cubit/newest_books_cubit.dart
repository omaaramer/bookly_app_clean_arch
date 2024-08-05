import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestBooksUseCase})
      : super(NewestBooksInitial());

  FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());

    var result = await fetchNewestBooksUseCase.call();

    result.fold((failure) {
      emit(NewestBooksFailureState(message: failure.message));
    }, (books) {
      emit(NewestBooksSuccessState(books: books));
    });
  }
}
