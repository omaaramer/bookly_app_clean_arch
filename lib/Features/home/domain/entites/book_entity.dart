// only data needed to build UI no from json or samething like models
class BookEntity {
  final String? bookId;
  final String? imageUrl;
  final String title;
  final String? author;
  final num rating;
  final num price;

  BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
  });
}
