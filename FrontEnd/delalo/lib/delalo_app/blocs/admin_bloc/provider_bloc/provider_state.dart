import 'package:delalo/delalo_app/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ProviderState extends Equatable {
  const ProviderState();
  @override
  List<Object> get props => [];
}

class ProvidersLoadInProgress extends ProviderState {
} //state fetching users providers from repository

class ProviderLoadSuccess extends ProviderState {
  //state after users providers have succecfully been loaded
  final List<User> providers;

  const ProviderLoadSuccess([this.providers = const []]);
  @override
  List<Object> get props => [providers];

  
}

class ProviderLoadFailiure extends ProviderState{}