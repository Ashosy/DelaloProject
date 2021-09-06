import 'package:delalo/delalo_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class OrderDetails extends Equatable {
  const OrderDetails({
    required this.order,
    required this.provider,
    required this.user,
  });

  final Order order;
  final User provider;
  final User user;

  @override
  List<Object> get props => [order, provider, user];

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      order: json['Order'],
      provider: json['Provider'],
      user: json['User'],
    );
  }
}
