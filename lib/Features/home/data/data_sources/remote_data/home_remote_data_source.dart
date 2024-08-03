import 'package:bookly/Features/home/domain/entites/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> featchFeaturedBooks();
  Future<List<BookEntity>> featchNewsetBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> featchFeaturedBooks() {
    // TODO: implement featchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> featchNewsetBooks() {
    // TODO: implement featchNewsetBooks
    throw UnimplementedError();
  }
}
