//review model
class Review {
  const Review(
      {required this.rating, required this.comment, required this.order_id});
  final double rating;
  final String comment;
  final int order_id;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        rating: json['rating'],
        comment: json['comment'],
        order_id: json['order_id']);
  }
}
