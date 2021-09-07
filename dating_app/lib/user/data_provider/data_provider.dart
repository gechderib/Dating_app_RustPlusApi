import 'dart:convert';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = 'http://127.0.0.1:5000/api';
  final http.Client httpClient;

  UserDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      Uri.http('http://127.0.0.1:5000/api', '/users'),
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

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }

  Future<List<User>> getUsers() async {
    final response = await httpClient.get('$_baseUrl/users');

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> deleteUser(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/users/$id',
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
      '$_baseUrl/users/${user.id}',
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

    if (response.statusCode != 204) {
      throw Exception('Failed to update user.');
    }
  }
}
