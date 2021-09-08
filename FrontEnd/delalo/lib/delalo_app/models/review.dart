//review model
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Review {
  const Review(
      {required this.rating, required this.comment, required this.order_id});
  final double rating;
  final String comment;
  final int order_id;
  @override
  List<Object> get props => [rating, comment, order_id];
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        rating: json['rating'],
        comment: json['comment'],
        order_id: json['order_id']);
  }
  @override
  String toString() => 'Review {rating: $rating, comment: $comment, order_id: $order_id}';
}
