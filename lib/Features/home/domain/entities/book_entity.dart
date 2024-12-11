import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? ratingCount;
  @HiveField(5)
  final num? averageRating;
  @HiveField(6)
  final List<String>? categories;
  @HiveField(7)
  final String? previewLink;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.ratingCount,
    required this.averageRating,
    required this.categories,
    required this.previewLink,
  });
}
