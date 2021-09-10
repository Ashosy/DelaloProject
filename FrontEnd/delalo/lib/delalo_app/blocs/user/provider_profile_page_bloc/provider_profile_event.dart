part of 'provider_profile_bloc.dart';

@immutable
abstract class ProviderProfileEvent {}

class LoadProviderInfo extends ProviderProfileEvent {
  final String providerId;

  LoadProviderInfo({required this.providerId});
}
