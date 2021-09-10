import 'package:bloc/bloc.dart';
import 'package:delalo/delalo_app/repository/user_repository/single_provider_page_repository.dart';
import 'package:flutter/material.dart';

part 'provider_profile_state.dart';
part 'provider_profile_event.dart';

class ProviderProfileBloc
    extends Bloc<ProviderProfileEvent, ProviderProfileState> {
  final ProviderProfileRepository providerProfileRepository;
  ProviderProfileBloc({required this.providerProfileRepository})
      : super(ProviderProfileInitial());

  @override
  Stream<ProviderProfileState> mapEventToState(
      ProviderProfileEvent event) async* {
    if (event is LoadProviderInfo) {
      yield ProviderInfoLoading();
      await Future.delayed(Duration(milliseconds: 500));
      try {
        final providerLoaded =
            await providerProfileRepository.getProvider(event.providerId);
        yield ProviderInfoLoadSuccess(providerLoaded);
      } catch (e) {
        yield ProviderInfoLoadFailure();
      }
    }
  }
}
