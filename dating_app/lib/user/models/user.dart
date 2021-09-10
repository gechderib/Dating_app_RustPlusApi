import 'package:equatable/equatable.dart';

class User {
  User(this.email, this.password,
      {this.id, this.username, this.name, this.address, this.age, this.like});

  String? id;
  String? username;
  String? name;
  String? email;
  String? password;
  String? address;
  String? age;
  String? like;

  @override
  // List<Object> get props => [id, username, name, email, password, address];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['email'],
      json['password'],
      username: json['username'],
      name: json['name'],
      address: json['address'],
      age: json['age'],
      like: json['like'],
      id: json['id'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "password": password,
      "username": username,
      "name": name,
      "address": address,
      "age": age,
      "like": like,
      "id": id,
    };
  }

  @override
  String toString() =>
      'User { id: $id, username: $username, name: $name,email: $email, password: $password, address: $address,age: $age, like: $like }';
}

class Login extends Equatable {
  final String id;
  final String email;
  final String password;
  final String username;
  final String name;
  final String address;

  Login(
      {required this.id,
      required this.email,
      required this.password,
      this.name = '',
      this.username = '',
      this.address = ''});

  @override
  List<Object> get props => [id, email, password];

  factory Login.fromJson(Map<String, dynamic> json) {
    print('dddddddddddddddddddppp');
    print(json);
    return Login(
        id: json['id'], email: json['email'], password: json['password']);
  }
  @override
  String toString() {
    return '{id: $id, email: $email, password: $password}';
  }
}
