import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/repository/user_repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository})
      : assert(CategoryRepository != null),
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoriesLoad) {
      yield CategoryLoading();
      try {
        final categories = await categoryRepository.getCategories();

        yield CategoriesLoadSuccess(categories);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }
  }
}
