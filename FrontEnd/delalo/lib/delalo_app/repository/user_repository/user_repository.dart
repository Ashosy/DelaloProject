import 'package:meta/meta.dart';
import 'package:/delalo/delalo_app/exports.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({@required this.dataProvider})
      : assert(dataProvider != null);


  Future<List<User>> getUser() async {
    return await dataProvider.getCourses();
  }
  Future<void> updateUser(User user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    await dataProvider.deleteUser(id);
  }
}