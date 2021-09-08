import 'package:delalo/delalo_app/models/category.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoadInProgress extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  final List<Category> categories;

  const CategoryLoadSuccess([this.categories = const []]);
  
  
}
