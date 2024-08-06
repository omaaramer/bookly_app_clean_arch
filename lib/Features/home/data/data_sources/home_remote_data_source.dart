import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/save_books_on_hive.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:hive/hive.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> featchFeaturedBooks({int pageNum = 0});
  Future<List<BookEntity>> featchNewsetBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> featchFeaturedBooks({int pageNum = 0}) async {
    var response = await apiService.get(
        'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNum * 10}');
    List<BookEntity> books = getBooksList(response);

    saveBooksOnHive(books, kFeaturedBook);
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
