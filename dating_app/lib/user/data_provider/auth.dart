import 'dart:convert';
import 'dart:io';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

final _baseUrl = 'http://127.0.0.1:5000';

class ClientAuthDataProvider {

  static Future<String> deleteaccount(User user, String id) async {
    var result = "";

    try {
      print("at DataProvider");
      print(user.tojson());
      print(id);

      final httpresponse = await http.delete(
        Uri.parse('$_baseUrl/api/${id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          "email": user.tojson()['email'],
        },
      );
      print("sent delete request");
      if (httpresponse.statusCode == 204) {
        result = jsonDecode(httpresponse.body).toString();
      } else if (httpresponse.statusCode == 404) {
        result = jsonDecode(httpresponse.body).toString();
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }


  static Future<User> register(User user) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'username': user.username,
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'address': user.address,
        'age': user.age,
        'like': user.like,
        'image': user.image,
        'choiceAge': user.choiceAge,
        'sex': user.sex,
        'religion': user.religion,
        'color': user.color,
      }),
    );
    print(response);
    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }

  static Future<dynamic> login(LoginModel loginModel) async {
    print('kkkkkkkkkkkkkkkkkkkkk');
    final response = await http.post(
      Uri.parse('$_baseUrl/api/userlogin'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'email': loginModel.email,
        'password': loginModel.password,
      }),
    );
    print(loginModel.email);
    print((response.body).runtimeType);
    print((response.body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      print(loginModel.toString());
      return loginModel;
    } else if (response.statusCode == 201) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else if (response.body == 'Wrong email or password') {
      print(response.body);
      print('fkfkfkfkfkfk');
      return 'Wrong email or password hone man';
    } else {
      throw Exception('Failed to create login.');
    }
  }

  Future<List<Login>> getLoginUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/api/userlogin'));

    if (response.statusCode == 200) {
      final loginUser = jsonDecode(response.body) as List;
      return loginUser.map((loginUser) => Login.fromJson(loginUser)).toList();
    } else {
      throw Exception('Failed to login user');
    }
  }
}
