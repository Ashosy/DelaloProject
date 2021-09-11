import 'package:delalo/delalo_app/blocs/bottom_nav_bloc/bottomNavigationBloc.dart';
import 'package:delalo/delalo_app/blocs/bottom_nav_bloc/bottomNavigationEvent.dart';
import 'package:delalo/delalo_app/blocs/bottom_nav_bloc/bottomNavigationState.dart';
import 'package:delalo/delalo_app/screens/category_page.dart';
import 'package:delalo/delalo_app/screens/provider_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_drawer/navigation_drawer.dart';


class BottomNav extends StatelessWidget {
  static const routeName='/bottomnavpage';
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocConsumer<BottomNavigationBloc,BottomNavigationState>(
              listener: (context,bottomState){
                if(bottomState is ShowHomePage){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new CategoryPage()));
                }
                else if(bottomState is ShowCategoryPage){
                  Navigator.push(context,  new MaterialPageRoute(builder: (context) => new CategoryPage()));
                }
                else if(bottomState is ShowOrdersPage){
                 Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProviderListPage()));
                }
                else if(bottomState is ShowJobsPage){
                 Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProviderListPage()));
                }
                else if(bottomState is ShowAccountPage){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProviderListPage()));
                }
                  
                },
              
              builder: (context,bottomState){
                currentIndex=bottomState.posIndex;
                  return Scaffold(
                      appBar: AppBar(
                        title: Text("Home"),
                      ),
                      drawer: NavigationDrawer(),
                      bottomNavigationBar: 
                  BottomNavigationBar(
                    currentIndex: currentIndex,
                    onTap: (currentIndex){
                      if(currentIndex==0){
                          final navBottomBloc= BlocProvider.of<BottomNavigationBloc>(context);
                      navBottomBloc.add(
                        BottomHomePageEvent()
                      );
                      }
                      else if(currentIndex==1){
                        final navBottomBloc= BlocProvider.of<BottomNavigationBloc>(context);
                      navBottomBloc.add(
                        BottomCategoryPageEvent()
                      );
                      }
                       else if(currentIndex==2){
                        final navBottomBloc= BlocProvider.of<BottomNavigationBloc>(context);
                      navBottomBloc.add(
                        BottomOrdersPageEvent()
                      );
                      }
                       else if(currentIndex==3){
                         final navBottomBloc= BlocProvider.of<BottomNavigationBloc>(context);
                      navBottomBloc.add(
                        BottomJobsPageEvent()
                      );
                      }
                       else if(currentIndex==4){
                        final navBottomBloc= BlocProvider.of<BottomNavigationBloc>(context);
                        navBottomBloc.add(
                        BottomAccountPageEvent()
                      );
                      }
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                         backgroundColor: Colors.black,
                        label: "Home"
                        
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        backgroundColor: Colors.black,
                        label: "Category"
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.assignment),
                         backgroundColor: Colors.black,
                        label: "Orders"
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.work),
                         backgroundColor: Colors.black,
                        label: "Jobs"
                      ),
                    
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle),
                        backgroundColor: Colors.black,
                        label: "Account"
                      ),
                    ],
                  ),   
            );
              }
          ),
    );
  }
}