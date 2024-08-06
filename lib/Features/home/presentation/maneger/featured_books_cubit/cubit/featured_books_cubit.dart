import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/featch_feature_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.featchFeatureBooksUseCase})
      : super(FeaturedBooksInitial());

  final FeatchFeatureBooksUseCase featchFeatureBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(FeaturedBooksLoadingState());
    } else {
      emit(FeaturedBooksPaginationLoadingState());
    }

    var result = await featchFeatureBooksUseCase.call(pageNum);
    //right side
    result.fold((failure) {
      if (pageNum == 0) {
        emit(FeaturedBooksFailureState(message: failure.message));
      } else {
        emit(FeaturedBooksPaginationFailureState(message: failure.message));
      }
    },
        // left side
        (books) {
      emit(FeaturedBooksSuccessState(books: books));
    });
  }
}
