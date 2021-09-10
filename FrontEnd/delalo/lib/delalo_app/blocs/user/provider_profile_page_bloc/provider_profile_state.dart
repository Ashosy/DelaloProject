part of 'provider_profile_bloc.dart';

@immutable
abstract class ProviderProfileState {}

class ProviderProfileInitial extends ProviderProfileState {}

class ProviderInfoLoading extends ProviderProfileState {}

class ProviderInfoLoadSuccess extends ProviderProfileState {
  final provider;

  ProviderInfoLoadSuccess(this.provider);
}

class ProviderInfoLoadFailure extends ProviderProfileState {}
