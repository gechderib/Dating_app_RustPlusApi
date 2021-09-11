import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/addApdate.dart';
import 'package:dating_app/user/screens/user_list.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class UserDetail extends StatelessWidget {
//   static const routeName = 'userDetail';
//   final User user;

//   UserDetail({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${this.user.name}'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () => Navigator.of(context).pushNamed(
//               AddUpdateUser.routeName,
//               arguments: UserArgument(user: this.user, edit: true),
//             ),
//           ),
//           SizedBox(
//             width: 32,
//           ),
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               BlocProvider.of<UserBloc>(context).add(UserDelete(this.user));
//               Navigator.of(context).pushNamedAndRemoveUntil(
//                   UserList.routeName, (route) => false);
//             },
//           ),
//         ],
//       ),
//       body: Card(
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('usrname: ${this.user.username}'),
//               subtitle: Text('full nama: ${this.user.name}'),
//             ),
//             Text(
//               'Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text('${this.user.email}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/home.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetail extends StatelessWidget {
  static const routeName = '/UserDetail';
  final User name;
  final Map<String, dynamic> _user = {};
  UserDetail(this.name);
  @override
  Widget build(BuildContext context) {
    print(getStringValuesSF);
    getStringValuesSF().then((news) {
      username = news;
    });

    print(name);
    return Scaffold(
      // backgroundColor: Colors.white70,
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "${name.name}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("${name.username}")
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 2,
                        width: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.green),
                      ),
                      Text(
                        "Online recently",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  children: [Icon(Icons.location_pin), Text("${name.address}")],
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text("Like her?")),
                    TextButton(onPressed: () {}, child: Text("Say Hello?")),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: 115,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      final UserEvent event = likeCreate((like(
                        likedBy: username,
                        liked: name.email!,
                      )));
                      print(event);
                      BlocProvider.of<UserBloc>(context).add(event);
                    },
                    child: Row(children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Like",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: 125,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Row(children: [
                      Icon(
                        Icons.email,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Message",
                        style: TextStyle(color: Colors.pinkAccent),
                      )
                    ])),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: 40,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Row(children: [
                      //Icon(Icons.email, color: Colors.pinkAccent,),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.pinkAccent),
                      ),
                    ])),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                onPressed: () {},
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.gif_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text("Super Link with Gift",
                      style: TextStyle(color: Colors.white))
                ])),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 150,
              //margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white30,
              ),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Religion:"), Text("Orthedox")]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Region:"), Text("Ethiopia")]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Martial Status:"), Text("Single")])
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future<dynamic> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('em');

    return stringValue;
  }
}
