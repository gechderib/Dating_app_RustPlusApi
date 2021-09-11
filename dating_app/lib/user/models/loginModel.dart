import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {
  String? email;
  String? password;
  // String? username;
  // String? name;
  // String? address;

  LoginModel(
    this.email,
    this.password,
    /*this.address, this.name, this.username*/
  );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    print('eeedddddddddddddduuuuuuuuuuuuuuuuuuuudddddd');
    print(json);
    return LoginModel(json['email'], json['password']);
  }

  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "password": password,
      // "address": address,
      // "name": name,
      // "username": username
    };
  }

  @override
  String toString() {
    return '$email $password';
  }
}

  Future<dynamic> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('em');

    return stringValue;
  }


class like extends Equatable {
  like({
    this.id,
    required this.likedBy,
    required this.liked,
  });

  final String? id;
  final String likedBy;
  final String liked;

  @override
  List<Object> get props => [likedBy, liked];

  factory like.fromJson(Map<String, dynamic> json) {
    return like(id: json['id'], likedBy: json['likedBy'], liked: json['liked']);
  }

  @override
  String toString() {
    return '{id: $id, LikedBy: $likedBy, Liked: $liked}';
  }
}