import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoad extends UserEvent {
  const UserLoad();

  @override
  List<Object> get props => [];
}

class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {user: $user}';
}

class UserLogin extends UserEvent {
  final Login login;
  const UserLogin(this.login);

  @override
  List<Object> get props => [login];

  @override
  String toString() => 'login create {login :$login}';
}

class UserUpdate extends UserEvent {
  final User user;

  const UserUpdate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated {user: $user}';
}

class UserDelete extends UserEvent {
  final User user;

  const UserDelete(this.user);

  @override
  List<Object> get props => [user];

  @override
  toString() => 'User Deleted {user: $user}';
}

class likeCreate extends UserEvent {
  final like Like;

  const likeCreate(this.Like);

  @override
  List<Object> get props => [Like];

  @override
  String toString() => 'User Created {user: $Like}';
}
