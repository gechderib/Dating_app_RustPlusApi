import 'dart:convert';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = 'http://127.0.0.1:5000';
  final http.Client httpClient;

  UserDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'username': user.username,
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'address': user.address
      }),
    );
    print(response);
    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }

  Future<List<User>> getUsers() async {
    final response = await httpClient.get(Uri.parse('$_baseUrl/api/users'));

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      print(users);
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      print('error happpen');
      throw Exception('Failed to load user');
    }
  }

  Future<void> deleteUser(String id) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/api/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete User.');
    }
  }

  Future<void> updateUser(User user) async {
    final http.Response response = await httpClient.put(
      Uri.parse('$_baseUrl/api/users/${user.email}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': user.username,
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'address': user.address
      }),
    );
    print(response);
    if (response.statusCode != 204) {
      throw Exception('Failed to update user.');
    }
  }

  Future<dynamic> loginUser(Login login) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/api/userlogin'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'email': login.email,
        'password': login.password,
      }),
    );
    print(response);
    if (response.statusCode == 201) {
      return Login.fromJson(jsonDecode(response.body));
    } else if (response.body == 'Wrong email or password') {
      return 'Wrong email or password';
    } else {
      throw Exception('Failed to create login.');
    }
  }
  Future<like> createlike(like Like) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/api/like',),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic>{'likedBy': Like.likedBy, 'liked': Like.liked}),
    );
    print(response);
    if (response.statusCode == 201) {
      return like.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }

  Future<List<Login>> getLoginUsers() async {
    final response = await httpClient.get(Uri.parse('$_baseUrl/api/userlogin'));

    if (response.statusCode == 200) {
      final loginUser = jsonDecode(response.body) as List;
      return loginUser.map((loginUser) => Login.fromJson(loginUser)).toList();
    } else {
      throw Exception('Failed to login user');
    }
  }
}
