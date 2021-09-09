import 'package:dating_app/user/bloc/register/register_event.dart';
import 'package:dating_app/user/bloc/register/register_state.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterIntial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisteringUser) {
      yield Registering();

      try {
        User newuser = await AuthRepository.RegisterUserRepo(event.user);
        print(newuser.tojson());
        var incommingValue = newuser.tojson();
        if (incommingValue['email'] == '') {
          yield FailedToRegister();
        } else if (incommingValue['email'] != '') {
          yield Registered(newuser);
          await Future.delayed(Duration(seconds: 2));
          yield RegisterIntial();


        }
      } catch (e) {
        yield FailedToRegister();
        await Future.delayed(Duration(seconds: 2));
        yield RegisterIntial();
      }
    }
  }
}
