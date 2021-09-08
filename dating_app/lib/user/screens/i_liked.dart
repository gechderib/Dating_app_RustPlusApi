import 'dart:convert';

import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_detail.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/screens/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final _baseUrl = 'http://127.0.0.1:5000';
var email = '';

class iliked extends StatelessWidget {
  List<User> userdata = [];
  static const routeName = '/iliked';

  // final http.Client httpClient;

  @override
  Widget build(BuildContext context) {
    print(getStringValuesSF);
    getStringValuesSF().then((news) {
      email = news;
    });
    return FutureBuilder(
        future: getIliked(email),
        builder: (_, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.9,
                    // width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (_, state) {
                        if (state is UserOperationFailure) {
                          return Text('Could not do course operation');
                        }
                        if (state is UserLoading) {
                          return SizedBox(
                              child: CircularProgressIndicator(),
                              height: 20,
                              width: 20);
                        }

                        if (state is UserLoadSuccess) {
                          final users = state.users;
                          final li = state.users;
                          getIliked("kide").then((news) {
                            userdata = news;
                            print("CDfghjnm");
                            print(userdata);
                            print("DSF");
                          });
                          print(userdata);

                          // print("SDFGHSADFG");
                          // print(getLikers("kide"));
                          // print("ssddsfgdffd");
                          var a = typee;
                          print("this is " + a);
                          List<User> suggest = [];
                          // for (var i = 0; i < users.length; i++) {
                          //   if (users[i].age < 10) {
                          //     suggest.add(users[i]);
                          //   }
                          // }

                          return Expanded(
                            child: list_widget(
                              users: snapshot.data,
                            ),
                          );
                        }

                        return Text("No Result");
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}

class list_widget extends StatelessWidget {
  list_widget({
    this.users,
  });

  final List<User>? users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users!.length,
        //itemBuilder: (_, idx) =>
        itemBuilder: (_, idx) {
          return Card(
              // In many cases, the key isn't mandatory
              key: UniqueKey(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('${users![idx].name}'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              NetworkImage("https://picsum.photos/250?image=9"),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.star),
                              Text(
                                '${users![idx].address}',
                                style: TextStyle(fontSize: 30),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.pink),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      UserDetail.routeName,
                                      arguments: users![idx]);
                                },
                                child: Text('view detail'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("22 years"),
                    )
                  ],
                ),
              ));
        });
  }
}

class ffg extends StatelessWidget {
  const ffg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}

Future<List<User>> getIliked(String email) async {
  final response = await http.get(Uri.parse('$_baseUrl/api/li/${email}'));

  if (response.statusCode == 200) {
    final users = jsonDecode(response.body) as List;
    print(users);
    return users.map((user) => User.fromJson(user)).toList();
  } else {
    print('error happpen');
    throw Exception('Failed to load user');
  }
}

Future<dynamic> getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString('em');

  return stringValue;
}
