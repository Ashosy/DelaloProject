import 'package:delalo/delalo_app/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}
//get category
class CategoriesLoaded extends CategoryEvent {}
//create category
class CategoryAdded extends CategoryEvent {
  final Category category;
  const CategoryAdded(this.category);

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'CategoryAdded {category: $category}';
}
// update category
class CategoryUpdate extends CategoryEvent {
  final Category category;
  const CategoryUpdate(this.category);
  @override
  List<Object> get props => [category];

  @override
  String toString() => 'CategoryAdded {category: $category}';
}
// delete category
class CategoryDelete extends CategoryEvent {
  final Category category;
  const CategoryDelete(this.category);

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'Category Deleted {category: $category}';
}
