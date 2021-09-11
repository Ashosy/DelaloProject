import 'package:delalo/delalo_app/blocs/provider_list_bloc/provider_list_bloc.dart';
import 'package:delalo/delalo_app/blocs/provider_list_bloc/provider_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import 'navigation_drawer/navigation_drawer.dart';

class ProviderListPage extends StatefulWidget {
  static const routeName='/providerlist';
  @override
  _ProviderListPageState createState() => _ProviderListPageState();
}

class _ProviderListPageState extends State<ProviderListPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(),
        body: BlocBuilder<ProviderListBloc, ProviderListState>(
        builder: (context, providerListState) {
          print(providerListState);
          if (providerListState is ProviderListLoading) {
            return Text("Loading...");
          }

          if (providerListState is ProviderListLoadFail) {
            return Text("Sorry loading failed");
          }

          if (providerListState is ProviderListLoadSuccess) {
            final providers = providerListState.providers;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: providers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8.0 / 10.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    
                    final provider = providers[index];
                    return Expanded(
          
                      child: Card(
                          color: Colors.grey[100],
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
                                        const EdgeInsets.symmetric(vertical: 20),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(provider.image),
                                          radius: 28,
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          provider.firstname + " " +provider.lastname,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          provider.description,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,color: Colors.yellow,),
                                            Text(provider.average_rating.toString())
                                        ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.check),
                                             Text(
                                              provider.jobs_done.toString()+" jobs done",
                                              style: TextStyle(fontSize: 10),
                                        ),
                                          ],
                                          
                                          )
                                       
                                      ],
                                    ),
                                  ),
                                )))
                              ]
                              )
                          ),
                    );
                  }),
            );
          }

          return Container();
        },
      ),
      ),
    );
  }
}