

import 'package:delalo/delalo_app/blocs/auth_bloc/login_bloc/login_bloc.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/blocs/user/provider_profile_page_bloc/provider_profile_bloc.dart';
import 'package:delalo/delalo_app/blocs/user/provider_profile_page_bloc/reviews_of_provider_bloc.dart';
import 'package:delalo/delalo_app/data_provider/auth_data/login_data.dart';
import 'package:delalo/delalo_app/data_provider/auth_data/singupUser_data.dart';
import 'package:delalo/delalo_app/data_provider/data_provider.dart';
import 'package:delalo/delalo_app/data_provider/user_data/single_provider_page_data.dart';
import 'package:delalo/delalo_app/repository/admin_repository/admin_category_repository.dart';
import 'package:delalo/delalo_app/repository/admin_repository/admin_order_jobs_repository.dart';
import 'package:delalo/delalo_app/repository/admin_repository/admin_provider_repository.dart';
import 'package:delalo/delalo_app/repository/auth_repository/login_repository.dart';
import 'package:delalo/delalo_app/repository/auth_repository/signupProvider_repository.dart';
import 'package:delalo/delalo_app/repository/auth_repository/signupUser_repository.dart';
import 'package:delalo/delalo_app/repository/user_repository/order_jobs_repository.dart';
import 'package:delalo/delalo_app/repository/user_repository/provider_list_repository.dart';
import 'package:delalo/delalo_app/repository/user_repository/search_repository.dart';
import 'package:delalo/delalo_app/screens/bottom_nav.dart';
import 'package:delalo/delalo_app/repository/user_repository/single_provider_page_repository.dart';
import 'package:delalo/delalo_app/screens/navigation_drawer/navigation.dart';
// import 'package:/delalo/delalo_app/blocs/admin_bloc/category_bloc/category_event.dart';
import 'package:delalo/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:delalo/delalo_app/repository/user_repository/category_repository.dart';
import 'blocs/auth_bloc/signupProvider_bloc/signupProvider_bloc.dart';
import 'blocs/auth_bloc/signupUser_bloc/signupUser_bloc.dart';
import 'blocs/bottom_nav_bloc/bottomNavigationBloc.dart';
import 'blocs/provider_list_bloc/provider_list_bloc.dart';
import 'blocs/provider_list_bloc/provider_list_event.dart';
import 'blocs/search_bloc/search_bloc.dart';

import 'blocs/admin_bloc/category_bloc/category_bloc.dart';
import 'blocs/admin_bloc/category_bloc/category_event.dart';
import 'blocs/admin_bloc/order_bloc/order_bloc.dart';
import 'blocs/admin_bloc/order_bloc/order_event.dart';
import 'blocs/admin_bloc/provider_bloc/provider_bloc.dart';
import 'blocs/admin_bloc/provider_bloc/provider_event.dart';
import 'blocs/auth_bloc/signupProvider_bloc/signupProvider_bloc.dart';
import 'blocs/auth_bloc/signupUser_bloc/signupUser_bloc.dart';
import 'data_provider/admin_data/admin_order_jobs_data.dart';
import 'data_provider/admin_data/category_data.dart';
import 'data_provider/admin_data/provider_data.dart';
import 'data_provider/auth_data/singupProvider_data.dart';
import 'data_provider/user_data/category_data.dart';
import 'data_provider/user_data/provider_list_data.dart';
import 'data_provider/user_data/search_data.dart';

class MyApp extends StatelessWidget {
  final String category="gfd";
    int currentIndex=0;
  static final httpClient = http.Client();
  final orderRepository = OrderRepository(
      dataProvider: OrderDataProvider(
    httpClient: httpClient,
  ));

  final loginRepository =
      LoginRepository(dataProvider: LoginDataProvider(httpClient: httpClient));
  final signupUserRepository = SignupUserRepository(
      dataProvider: SignupUserDataProvider(httpClient: httpClient));
  final signupProviderRepository = SignupProviderRepository(
      dataProvider: SignupProviderDataProvider(httpClient: httpClient));    
  final CategoryRepository categoryRepository = CategoryRepository(
  dataProvider: CategoryDataProvider(
    httpClient: http.Client(),
    ),
  );
  final searchRepository= SearchCategoryRepository(searchCategoryDataProvider: SearchCategoryDataProvider(httpClient: http.Client()) );
  final providerListRepository = ProviderListRepository(providerListDataProvider: ProviderListDataProvider(httpClient: http.Client()));
      
  final providerProfileRepository = ProviderProfileRepository(
      dataProvider: ProviderProfileDataProvider(httpClient: httpClient));

  final adminCategoryRepository = AdminCategoryRepository(
      categoryDataProvider: AdminCategoryDataProvider(
    httpClient: http.Client(),
  ));
  final providersRepository = AdminProviderRepository(
      providerDataProvider: AdminProviderDataProvider(
    httpClient: http.Client(),
  ));
  final adminOrdersRepository = AdminOrderRepository(
      orderdataProvider: AdminOrderDataProvider(
    httpClient: http.Client(),
  ));
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AdminCategoryBloc(categoryRepository: adminCategoryRepository)
                  ..add(
                    LoadAllCategories(),
                  )),
        BlocProvider(
            create: (context) =>
                ProvidersBloc(providersRepository: providersRepository)
                  ..add(
                    LoadAllProviders(),
                  )),
        BlocProvider(
            create: (context) =>
                AdminOrderBloc(adminOrderRepository: adminOrdersRepository)
                  ..add(
                    AdminOrdersLoad(),
                  )),
        BlocProvider(
          create: (context) => OrderBloc(orderRepository: orderRepository)
            ..add(
              OrdersLoad(),
            ),
        ),
        BlocProvider(
            create: (context) => LoginBloc(loginRepository: loginRepository)),
        BlocProvider(
            create: (context) =>
                SignupUserBloc(signupUserRepository: signupUserRepository)),
        BlocProvider(
            create: (context) =>
                SignupProviderBloc(signupProviderRepository: signupProviderRepository)..add(LoadProviderSignup())),
        BlocProvider(
                create: (context) =>
                    CategoryBloc(categoryRepository: categoryRepository)
                      ..add(
                        CategoriesLoad(),
                      ),

        ),
        BlocProvider<SearchBloc>(
        create: (context)=> SearchBloc(searchRepository: searchRepository)
        ),
         BlocProvider<ProviderListBloc>(
          create: (context)=> ProviderListBloc(providerListRepository: providerListRepository)..add(ProviderListLoad(category: category))),
          BlocProvider<BottomNavigationBloc>(
          create: (cntx)=> BottomNavigationBloc(currentIndex),
        ),
           
        BlocProvider(
            create: (context) => ProviderProfileBloc(
                providerProfileRepository: providerProfileRepository)
              ..add(LoadProviderInfo(
                  providerId: "613a6d0efa94bb01f0afbfa5",
                  seekerId: "6118e035e030821c38a75f24"))),
        BlocProvider(
            create: (context) => ReviewsOfProviderBloc(
                providerProfileRepository: providerProfileRepository)
              ..add(LoadReviewsOfProvider(
                  providerId: "613a6d0efa94bb01f0afbfa5")))
      ],
      child: MaterialApp(
        home: Scaffold(
          drawer: NavigationDrawer(),
          bottomNavigationBar: BottomNav(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.singleProviderPageName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
 