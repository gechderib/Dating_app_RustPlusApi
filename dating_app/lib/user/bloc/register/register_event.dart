import 'package:dating_app/user/models/user.dart';
import 'package:equatable/equatable.dart';



class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisteringUser extends RegisterEvent {
  final User user;

  RegisteringUser(this.user);
  @override
  List<Object?> get props => [user];
}
