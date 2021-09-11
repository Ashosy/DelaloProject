import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.email,
    required this.role,
    required this.phone,
    required this.address,
    required this.average_rating,
  });
  final String id;
  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String role;
  final String phone;
  final String address;
  final int average_rating;

  @override
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        password,
        email,
        role,
        phone,
        address,
        average_rating,
      ];

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        password: json['password'],
        email: json['email'],
        role: json['role'],
        phone: json['phone'],
        address: json['address'],
        average_rating: json['average_rating'],
      );

  @override
  String toString() =>
      'User { firstname: $firstname, lastname: $lastname, email: $email,  role: $role, phone: $phone, adderess: $address , average_rating: $average_rating }';
}
