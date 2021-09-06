import 'package:delalo/delalo_app/data_provider/admin_data/provider_data.dart';
import 'package:delalo/delalo_app/models/user.dart';

class AdminProviderRepository {
  final AdminProviderDataProvider providerDataProvider;
  AdminProviderRepository({required this.providerDataProvider})
      : assert(providerDataProvider != null);
  Future<List<User>> getProvidersFromProvider() async {
    return await providerDataProvider.getProvidersFromProvider();
  }

  Future<List<void>> getProviderFromProvider(String id) async {//the void may be a user so check
    return await providerDataProvider.getProviderFromProvider(id);
  }
}
