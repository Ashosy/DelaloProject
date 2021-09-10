
import 'package:delalo/delalo_app/data_provider/user_data/single_provider_page_data.dart';
import 'package:delalo/delalo_app/models/models.dart';

class ProviderProfileRepository {
  final ProviderProfileDataProvider dataProvider;

  ProviderProfileRepository({required this.dataProvider});

  Future<User> getProvider(String id) async {
    return await dataProvider.getProvider(id);
  }
}
