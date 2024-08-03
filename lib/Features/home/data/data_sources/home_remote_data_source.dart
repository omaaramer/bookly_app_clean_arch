import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> featchFeaturedBooks();
  Future<List<BookEntity>> featchNewsetBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> featchFeaturedBooks() async {
    var response =
        await apiService.get('volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(response);
    return books;
  }

  @override
  Future<List<BookEntity>> featchNewsetBooks() async {
    var response = await apiService
        .get('volumes?Filtering=free-ebooks&q=programming&Sorting=newest');
    List<BookEntity> books = getBooksList(response);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> response) {
    List<BookEntity> books = [];
    for (var bookMap in response['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
