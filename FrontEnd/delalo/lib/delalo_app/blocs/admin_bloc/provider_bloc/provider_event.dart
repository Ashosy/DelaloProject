import 'package:equatable/equatable.dart';

abstract class ProviderEvent extends Equatable {
  const ProviderEvent();
  @override
  List<Object> get props => [];
}

class ProvidersLoaded extends ProviderEvent{}

