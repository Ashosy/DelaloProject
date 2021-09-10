import 'package:flutter/material.dart';
// import 'package:delalo/routeGenerator.dart';
import 'package:flutter/cupertino.dart';
import 'package:delalo/delalo_app/blocs/category/category_bloc.dart';
import 'package:delalo/delalo_app/blocs/category/category_event.dart';
import 'package:delalo/delalo_app/blocs/category/category_state.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);
  static final routeName = "/category";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cateogories"),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (_, CategoryState) {
          print(CategoryState);
          if (CategoryState is CategoryLoading) {
            return Text("Loading...");
          }

          if (CategoryState is CategoryOperationFailure) {
            return Text("Sorry loading failed");
          }

          if (CategoryState is CategoriesLoadSuccess) {
            final categories = CategoryState.categories;

            return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Card(
                      color: Colors.purple[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black,
                      child: ListTile(
                        title: Text(category.description),
                        subtitle: Text(
                            'Number of providers: ${category.numOfProviders}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                    ),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
