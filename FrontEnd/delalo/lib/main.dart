import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/blocs/category/category_bloc.dart';
import 'package:delalo/delalo_app/blocs/category/category_event.dart';
import 'package:delalo/delalo_app/blocs/category/category_state.dart';
import 'package:delalo/delalo_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/user_account_page.dart';
import 'package:delalo/delalo_app/screens/edit_profile_user.dart';
import 'package:delalo/delalo_app/screens/category_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delalo_app/data_provider/user_data/category_data.dart';
import 'delalo_app/repository/user_repository/category_repository.dart';
import 'package:http/http.dart' as http;

final CategoryRepository categoryRepository = CategoryRepository(
  dataProvider: CategoryDataProvider(
    httpClient: http.Client(),
  ),
);

class UserInfo {
  final String name;
  final String email;
  final String phoneNo;
  final String address;
  const UserInfo(this.name, this.email, this.phoneNo, this.address);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final categoryRepository =
  //     CategoryRepository(dataProvider: CategoryDataProvider());

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //     providers: [
        //       BlocProvider(
        //         create: (ctx) =>
        //             CategoryBloc(categoryRepository: categoryRepository)
        //               ..add(
        //                 CategoriesLoad(),
        //               ),
        //       ),
        //     ],
        //     child:
        MaterialApp(
      // debugShowCheckedModeBanner: false,
      // initialRoute: CategoryPage.routeName,
      // routes: {
      //   CategoryPage.routeName: (ctx) => CategoryPage(),
      // },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //CategoryPage(),

          AccountPage(
              userInfo: UserInfo(
        "Janine Doe",
        "janine@doe.com",
        "0945633210",
        "Addis Ababa, 5kilo",
      )),
    );
  }
}
