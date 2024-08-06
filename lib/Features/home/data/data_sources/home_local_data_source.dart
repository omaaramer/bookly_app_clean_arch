import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturedBooks({int pageNum = 0});
  List<BookEntity> featchNewsetBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> featchFeaturedBooks({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBook);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> featchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBook);
    return box.values.toList();
  }
}
