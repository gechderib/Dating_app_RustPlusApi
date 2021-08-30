import 'package:equatable/equatable.dart';


class User extends Equatable {
  User(
      {
      required this.id,
      required this.username,
      required this.name,
      required this.email,
      required this.password,
      required this.address});

  final String id;
  final String username;
  final String name;
  final String email;
  final String password;
  final String address;

  @override
  List<Object> get props => [id, username,name,email,password,address];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address']

    );
  }

  @override
  String toString() => 'Course { id: $id, username: $username, name: $name,email: $email, password: $password, address: $address }';
}
