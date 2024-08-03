import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturedBooks();
  List<BookEntity> featchNewsetBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> featchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBook);
    return box.values.toList();
  }

  @override
  List<BookEntity> featchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBook);
    return box.values.toList();
  }
}
