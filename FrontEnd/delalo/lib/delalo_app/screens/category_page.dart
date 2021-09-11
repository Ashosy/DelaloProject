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
      // categoryBloc.add()
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (_, CategoryState) {
          if (CategoryState is CategoryLoading) {
            return Text("Loading...");
          }

          if (CategoryState is CategoryOperationFailure) {
            return Text("Sorry loading failed");
          }

          if (CategoryState is CategoriesLoadSuccess) {
            final categories = CategoryState.categories;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8.0 / 8.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    final category = categories[index];
                    return Card(
                        color: Colors.purple[50],
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 50),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          category.description,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          category.description,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          category.numOfProviders.toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )))
                            ]));
                  }),
            );
          }

          return Container();
        },
      ),
    );
  }
}
