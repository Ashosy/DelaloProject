import 'package:flutter/material.dart';
// import 'package:delalo/routeGenerator.dart';
import 'package:flutter/cupertino.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (_, CategoryState) {
            if (CategoryState is CategoryLoading) {
              return Text("Loading...");
            }

            if (CategoryState is CategoryOperationFailure) {
              return Text("Sorry loading failed");
            }

            if (CategoryState is CategoriesLoadSuccess) {
              final CategoryPage = CategoryState.categories;

              return ListView.builder(
                itemCount: CategoryPage.length,
                itemBuilder: (context, index) {
                  final category = CategoryPage[index];
                  return ListTile(
                    title: Text('Random text'),
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
