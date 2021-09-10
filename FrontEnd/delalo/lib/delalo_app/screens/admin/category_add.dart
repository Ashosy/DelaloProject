

import 'package:flutter/material.dart';

class AdminAddUpdateCategory extends StatefulWidget {
  static const routeName = '/updateAdd';
  // final CategoryArgument args;
  // final Map args;

  const AdminAddUpdateCategory({Key? key}) : super(key: key);

  @override
  _AdminAddUpdateCategoryState createState() => _AdminAddUpdateCategoryState();
}

class _AdminAddUpdateCategoryState extends State<AdminAddUpdateCategory> {
  // final categoryBloc = BlocProvider.of<CategoryBloc>(context);

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _category = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Delalo"),
      ),
      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          child: Form(
            
            key: _formKey,
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Center(
                  child: Text("Add Category",),
                ),
                TextFormField(
                  
                    decoration: InputDecoration(
                      icon: Icon(Icons.category), 
                      labelText: "Category Name"
                    ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration( 
                    icon: Icon(Icons.image),
                    labelText: "Category Image"
                  ),
                ),
                SizedBox(height: 20,),
                 TextFormField(
                  decoration: InputDecoration( 
                    icon: Icon(Icons.description),
                    labelText: "Category Description"
                  ),
                )

              ],)
            
             ),
        ),
      ),
      
    );

  }
}