import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> saveBooksOnHive(List<BookEntity> books, String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  await box.addAll(books);
}
