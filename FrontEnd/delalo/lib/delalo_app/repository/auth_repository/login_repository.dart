
import 'package:delalo/delalo_app/data_provider/auth_data/login_data.dart';
import 'package:delalo/delalo_app/models/models.dart';



class LoginRepository {
  final LoginDataProvider dataProvider;

  LoginRepository({required this.dataProvider});

  Future<void> login(Login login) async {
    await dataProvider.login(login);
  }
}
