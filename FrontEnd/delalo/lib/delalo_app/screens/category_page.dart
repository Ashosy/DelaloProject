import 'package:delalo/delalo_app/blocs/search_bloc/search_bloc.dart';
import 'package:delalo/delalo_app/blocs/search_bloc/search_event.dart';
import 'package:delalo/delalo_app/blocs/search_bloc/search_state.dart';
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
     final searchBloc=BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
                  onPressed: (){
                    showSearch(
                    context: context, 
                    delegate: SearchCategory(
                      searchBloc: searchBloc
                      )
                    );
                  },
                  icon: Icon(Icons.search),
                )
        ],
        
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


class SearchCategory extends SearchDelegate<List>{
  SearchBloc searchBloc;
  SearchCategory({required this.searchBloc});
 
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query='';
        }, 
        icon: Icon(Icons.clear),
      )
    ];
      
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context,[]);
        },
      icon: Icon(Icons.arrow_back_ios)
     
     );
  }

  @override
  Widget buildResults(BuildContext context) {
      searchBloc.add(Search(query:query));
      print(query);
      return BlocBuilder<SearchBloc,SearchState>(
        builder: (BuildContext context,SearchState state) {
          print(state);
          if(state is SearchUninitialized){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is SearchError){
            return Center(
              child: Text("Failed to load"),
            );
          }
          else if(state is SearchLoaded){
            if(state.categories.isEmpty){
              return Center(
                child: Text("No results found"),
              );
            }
            else{
               return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (_, index) {
                  final category = state.categories[index];
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
                }
                );
              }
          }
          return Container();
        }
      );
  }
              
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  

}
