import 'package:dating_app/user/bloc/login/login_event.dart';
import 'package:dating_app/user/bloc/login/login_state.dart';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoggedOut());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LogingUserEvent) {
      yield Loging();
      try {
        print('--------------------------------------');
        LoginModel incommingvalue =
            await AuthRepository.LoginUserRepo(event.loginModel);
        print('================================');

        String info = incommingvalue.email!;
        addStringToSF(info);
        print(info);
        yield Logedin(info);
      } catch (e) {
        yield FaildLoging();
        await Future.delayed(Duration(seconds: 2));
        yield LoggedOut();
      }
    }

    if (event is LogoutEvent) {
      String logoutuser = '';
      yield Logedin(logoutuser);
    }

    // if (event is DeleteUserEvent) {
    //   try {
    //     String response =
    //         await AuthRepository.DeleteUserRepo(event.user, event.user.email);
    //     print(response);
    //   } catch (e) {}
    // }
  }
}

addStringToSF(email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('em') != null) {
    prefs.remove('em');
    prefs.setString('em', email);
  }
  prefs.setString('em', email);
}
