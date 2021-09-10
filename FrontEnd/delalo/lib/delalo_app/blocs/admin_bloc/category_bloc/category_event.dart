import 'package:delalo/delalo_app/models/category.dart';
import 'package:equatable/equatable.dart';


abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadAllCategories extends CategoryEvent {
  const LoadAllCategories();

  @override
  // TO DO: implement props
  List<Object> get props => [];
}

class AddCategory extends CategoryEvent {
  final Category category;
  const AddCategory(this.category);

  @override
  // TO DO: implement props
  List<Object> get props => [category];

  @override
  String toString() => 'Added Category {category: $category}';
}
