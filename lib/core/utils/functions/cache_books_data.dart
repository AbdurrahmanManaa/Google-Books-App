import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

void cacheBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
