import '../../domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturedBooks();
  List<BookEntity> featchNewsetBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> featchFeaturedBooks() {
    // TODO: implement featchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> featchNewsetBooks() {
    // TODO: implement featchNewsetBooks
    throw UnimplementedError();
  }
}
