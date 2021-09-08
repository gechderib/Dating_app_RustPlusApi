import 'package:dating_app/user/data_provider/auth.dart';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/user.dart';

class AuthRepository {
  //Register mmmmm

  static Future<User> RegisterUserRepo(User user) async {
    print("passed auth repo");
    return await ClientAuthDataProvider.register(user);
  }

  //Login mmmm

  static Future<LoginModel> LoginUserRepo(LoginModel loginModel) async {
    print('jjjjjjjjjjjjjjj');
    return await ClientAuthDataProvider.login(loginModel);
  }

  //Delete mmmm
  static Future<String> DeleteUserRepo(User user, String id) async {
    print("Delete User Repo!");
    return await ClientAuthDataProvider.deleteaccount(user, id);
  }
}
