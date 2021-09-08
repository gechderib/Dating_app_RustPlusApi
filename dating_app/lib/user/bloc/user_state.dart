import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}
class likeState extends Equatable {
  const likeState();

  @override
  List<Object> get props => [];
}
class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> users;

  UserLoadSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class LoginLoadSuccess extends UserState {
  final List<Login> logins;
  LoginLoadSuccess([this.logins = const []]);

  @override
  List<Object> get props => [logins];
}


class LoginLoading extends UserState {}


class UserOperationFailure extends UserState {}

class likeLoadSuccess extends likeState {
  final List<like> Like;

  likeLoadSuccess([this.Like = const []]);

  @override
  List<Object> get props => [Like];
}