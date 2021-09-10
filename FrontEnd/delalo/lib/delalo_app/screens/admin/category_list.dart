import 'package:delalo/delalo_app/blocs/admin_bloc/category_bloc/category_state.dart';
import 'package:delalo/delalo_app/blocs/admin_bloc/category_bloc/category_bloc.dart';
import 'package:delalo/delalo_app/blocs/admin_bloc/category_bloc/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryList extends StatefulWidget {
  static const routeName = '/';

  const AdminCategoryList({Key? key}) : super(key: key);

  @override
  _AdminCategoryListState createState() => _AdminCategoryListState();
}

class _AdminCategoryListState extends State<AdminCategoryList> {
  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () =>{}
              // Navigator.of(context).pushNamed(AddCategory)
          // {
          //   final category = Category(
          //       id: "1",
          //       name: 'Deliver',
          //       image: 'shopping_cart',
          //       numOfProviders: 13,
          //       description: "Delivery category");
          //   categoryBloc.add(AddCategory(category));
          // }
          ,
          child: Icon(Icons.add),
        ),
        body: Center(
          child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (_, categoryState) {
            if (categoryState is CategoryLoading) {
              return CircularProgressIndicator();
            } else if (categoryState is CategoryOperationFailed) {
              return Text("Loading failed");
            } else if (categoryState is CategoryLoaded) {
              final categories = categoryState.catagories;
              return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    final category = categories[index];
                    return Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=9'),
                        ),
                        title: Text(category.name),
                        subtitle: Text(
                            'Number of providers: ${(category.numOfProviders).toString()}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){}, 
                            icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),),
                            IconButton(
                              onPressed: (){}
                              // => Navigator.of(context).pushNamed(
                                // AdminDeleteCategory.routName), 
                            ,icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),)
                                            // AdminDeleteCategory(),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
        ));
  }
}
