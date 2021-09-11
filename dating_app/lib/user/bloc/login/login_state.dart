import 'package:dating_app/user/models/user.dart';
import 'package:equatable/equatable.dart';


class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}
class LoggedOut extends LoginState{}
class Loging extends LoginState {}

class FaildLoging extends LoginState {}

class Logedin extends LoginState {

  final String loggedinUserinfo;


  Logedin( this.loggedinUserinfo);

  @override
  List<Object?> get props => [loggedinUserinfo];
  
}

