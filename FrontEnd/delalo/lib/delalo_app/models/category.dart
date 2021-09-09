//category model
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Category {
  const Category(
      {required this.id,
      required this.name,
      required this.image,
      required this.numOfProviders,
      required this.description});
  final int id;
  final String name;
  final String image;
  final int numOfProviders;
  final String description;

  List<Object> get props => [id, image, numOfProviders, description];
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        numOfProviders: json['numOfProviders'],
        description: json['description']);
  }
  @override
  String toString() =>
      'Category {id: $id ,name : $name ,image: $image, numOfProviders: $numOfProviders, description: $description}';
}
