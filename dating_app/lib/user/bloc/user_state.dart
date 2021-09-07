import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState();

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

class UserOperationFailure extends UserState {}
