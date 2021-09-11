import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/addApdate.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/screens/usrchoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsrDetail extends StatelessWidget {
  static const routeName = 'usrDetail';

  final User user;
  UsrDetail({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Pofile'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.pinkAccent,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('/profile.png'),
                        ),
                      ),
                    ),
                    Text(
                      "${user.name}",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      "${user.email}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  "email",
                                  style: TextStyle(color: Colors.pinkAccent),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text("${user.email}"),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  "Location",
                                  style: TextStyle(color: Colors.pinkAccent),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text("${user.address}"),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.amber,
                                  primary: Colors.pinkAccent),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    UserChoicAddUpdate.routeName,
                                    arguments: UserArgument(
                                        user: this.user, edit: true));
                              },
                              child: Text('To whom you wanna to date')),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AddUpdateUser.routeName,
                                        arguments: UserArgument(
                                            user: this.user, edit: true));
                                  }),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.pinkAccent,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: new Text("Delete!!",
                                            style: TextStyle(
                                              color: Colors.red,
                                            )),
                                        content: new Text(
                                            "Are you sure about it ?.."),
                                        actions: <Widget>[
                                          new TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: new Text("Yes",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                            onPressed: () {
                                              context
                                                  .read<UserBloc>()
                                                  .add(UserDelete(this.user));
                                              // Navigator.of(context)
                                              //     .pushNamedAndRemoveUntil(
                                              //         UserList.routeName,
                                              //         (route) => false);
                                            },
                                          ),
                                          new TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.pinkAccent),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('No',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
