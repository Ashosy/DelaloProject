import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delalo/delalo_app/exports.dart';
import 'package:delalo/delalo_app/blocs/user/user_bloc/bloc.dart';
import 'package:delalo/delalo_app/blocs/category/category_bloc.dart';
import 'package:delalo/delalo_app/blocs/category/category_event.dart';
import 'package:delalo/delalo_app/blocs/category/category_state.dart';
import 'package:delalo/delalo_app/blocs/user/provider_bloc/provider_state.dart';
import 'package:delalo/delalo_app/blocs/user/provider_bloc/provider_bloc.dart';
import 'package:delalo/delalo_app/blocs/user/provider_bloc/provider_event.dart';
import '../../blocs/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);
  static final routeName = "/";
  @override
  HomeListViewState createState() => HomeListViewState();
}

class HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return
        //SingleChildScrollView(
        //child:
        //Row(children: [
        Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Stack(
        children: [
          TopProvider(),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: CategoryWidget(),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 600),
          //   child: CategoryWidget(),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 1200),
          //   child: CategoryWidget(),
          // ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (_, CategoryState) {
      if (CategoryState is CategoryLoading) {
        return Text("Loading...");
      }

      if (CategoryState is CategoryOperationFailure) {
        return Text("Sorry loading failed");
      }

      if (CategoryState is CategoriesLoadSuccess) {
        final categories = CategoryState.categories;
        // return Text("Success");
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      // constraints: BoxConstraints(
                      //     minHeight: 200, ),
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          // border: Border.all(),
                          color: Colors.grey[200],
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15))),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/signup.png',
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            categories[index].description,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            categories[index].numOfProviders.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              },
            ),
          )
        ]);
      }
      return Container();
    });
  }
}

class TopProvider extends StatelessWidget {
  const TopProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderBloc, ProviderState>(
        builder: (_, ProviderState) {
      if (ProviderState is ProviderLoading) {
        return Text("Loading...");
      }

      if (ProviderState is ProviderOperationFailure) {
        return Text("Sorry Loading Failed");
      }

      if (ProviderState is ProviderLoadSuccess) {
        final providers = ProviderState.provider;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Text(
                "Featured Providers",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: providers.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(15, 15)),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/user.png',
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            providers[index].firstname +
                                " " +
                                providers[index].lastname,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              },
            ),
          )
        ]);
      }
      return Container();
    });
  }
}
