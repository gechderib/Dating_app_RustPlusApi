import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogingUserEvent extends LoginEvent {
  final LoginModel loginModel;
  LogingUserEvent(this.loginModel);

  @override
  List<Object?> get props => [loginModel];
}

class LogoutEvent extends LoginEvent {}

class DeleteUserEvent extends LoginEvent {
  User user;
  // String id;
  DeleteUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}
