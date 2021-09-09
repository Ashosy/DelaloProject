import 'package:delalo/delalo_app/blocs/admin_bloc/category_bloc/category_event.dart';
import 'package:delalo/delalo_app/blocs/admin_bloc/category_bloc/category_state.dart';
import 'package:delalo/delalo_app/repository/admin_repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final AdminCategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    // TO DO: implement mapEventToState
    if (event is LoadAllCategories) {
      yield CategoryLoading();
      try {
        final categories = await categoryRepository.getCategoriesFromCategory();
        yield CategoryLoaded(categories);
      } catch (_) {
        yield CategoryOperationFailed();
      }
    }
    if (event is AddCategory) {
      try {
        final category = event.category;
        await categoryRepository.createCategory(category);
        final newcategory =
            await categoryRepository.getCategoriesFromCategory();
        yield CategoryLoaded(newcategory);
      } catch (_) {
        yield CategoryOperationFailed();
      }
    }
  }
}
