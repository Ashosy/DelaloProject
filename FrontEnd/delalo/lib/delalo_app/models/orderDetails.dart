import 'package:delalo/delalo_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class OrderDetails extends Equatable {
  const OrderDetails({
    this.order,
    this.provider,
    this.user,
  });

  final Order? order;
  final User? provider;
  final User? user;

  @override
  List<Object?> get props => [order, provider, user];

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    print("orderDetail$json\n\n");
    return OrderDetails(
      user: User.fromJson(json['User']),
      provider: User.fromJson(json['Provider']),
      order: Order.fromJson(json['Order']),
    );
  }
}
