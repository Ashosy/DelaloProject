import 'package:delalo/delalo_app/data_provider/admin_data/category_data.dart';
import 'package:delalo/delalo_app/models/category.dart';

class AdminCategoryRepository {
  final AdminCategoryDataProvider categoryDataProvider;
  AdminCategoryRepository({required this.categoryDataProvider})
      : assert(categoryDataProvider != null);
  Future<Category> createCategory(Category category) async {
    return await categoryDataProvider.createCategory(category);
  }

  Future<List<Category>> getCategoriesFromCategory() async {
    return await categoryDataProvider.getCategoriesFromCategory();
  }

  Future<void> deleteCategory(String id) async {
    return categoryDataProvider.deleteCategory(id);
  }

  Future<void> updateCategory(Category category) async {
    return categoryDataProvider.updateCategory(category);
  }
}
