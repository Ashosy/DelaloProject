import 'package:delalo/delalo_app/blocs/admin_bloc/provider_bloc/provider_bloc.dart';
import 'package:delalo/delalo_app/blocs/admin_bloc/provider_bloc/provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AdminProvidersList extends StatefulWidget {
  const AdminProvidersList({Key? key}) : super(key: key);

  @override
  _AdminProvidersListState createState() => _AdminProvidersListState();
}

class _AdminProvidersListState extends State<AdminProvidersList> {
  @override
  Widget build(BuildContext context) {
    final providersBloc = BlocProvider.of<ProvidersBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<ProvidersBloc, ProvidersState>(
            builder: (_, providersState) {
          if (providersState is ProviderLoading) {
            return CircularProgressIndicator();
          } else if (providersState is ProvidersOperationsFailed) {
            return Text("Loading failed");
          } else if (providersState is ProviderLoaded) {
            final providers = providersState.providers;
            return ListView.builder(
                itemCount: providers.length,
                itemBuilder: (_, index) {
                  final provider = providers[index];
                  if (provider.role == 'provider') {
                    return Container(
                      //  color: Colors.grey[100],

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=9'),
                        ),
                        title: Text(provider.firstname),
                        subtitle: Text(provider.lastname),
                      ),
                    );
                  } else {
                    return Container();
                  }
                });
          }
          return Container();
        }),
      ),
    );
  }
}