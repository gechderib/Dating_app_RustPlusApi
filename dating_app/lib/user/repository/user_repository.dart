import 'package:dating_app/user/data_provider/data_provider.dart';
import 'package:dating_app/user/data_provider/user_data.dart';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';

class UserRepository {
  final UserDataProvider userDataProvider;

  UserRepository({required this.userDataProvider})
      : assert(userDataProvider != null);

  Future<User> createUser(User user) async {
    return await userDataProvider.createUser(user);
  }

  Future<List<User>> getUser() async {
    return await userDataProvider.getUsers();
  }

  Future<void> updateUser(User user) async {
    await userDataProvider.updateUser(user);
  }
  
  Future<void> deleteUser(String email) async {
    await userDataProvider.deleteUser(email);
  }

  Future<Login> loginUser(Login login) async {
    return await userDataProvider.loginUser(login);
  }

  Future<List<Login>> getLoginUser() async {
    return await userDataProvider.getLoginUsers();
  }
  Future<like> createlike(like Like) async {
    return await userDataProvider.createlike(Like);
  }
}
