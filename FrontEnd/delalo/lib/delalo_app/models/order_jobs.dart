import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Order extends Equatable{
  const Order(
    {
      required this.id,
      required this.progress,
      required this.order_completed_date,
      required this.final_payment,
      required this.status,
      required this.is_completed,
      required this.order_created_date,
      required this.start_time,
      required this.saved_time,
      required this.unique_code,
      required this.seeker_id,
      required this.provider_id,
    }
  );

  final String id;
  final String status;
  final String progress;
  final String order_created_date;
  final String order_completed_date;
  final String is_completed;
  final DateTime start_time;
  final int saved_time;
  final int unique_code;
  final String seeker_id;
  final String provider_id;
  final int final_payment;

  @override
  List<Object> get props => [id,
                            status,
                            progress,
                            order_created_date,
                            order_completed_date,
                            start_time,
                            saved_time,
                            unique_code,
                            seeker_id,
                            provider_id,
                            final_payment];

  factory Order.fromjson(Map<String,dynamic> json){
    return Order(
      id:json['id'],
      status:json['status'],
      progress: json['progress'],
      order_created_date: json['order_created_date'],
      order_completed_date: json['order_completed_date'],
      is_completed: json['is_completed'],
      start_time: json['start_time'],
      saved_time: json['saved_time'],
      unique_code: json['unique_code'],
      seeker_id: json['seeker_id'],
      provider_id: json['provider_id'],
      final_payment: json['final_payment']
    );
  }
}
