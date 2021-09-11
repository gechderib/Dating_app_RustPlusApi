import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_detail.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/screens/usrdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addApdate.dart';

class Xxxx extends StatelessWidget {
  const Xxxx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child:
                          Image.network('https://picsum.photos/250?image=9')),
                ),
                Expanded(child: Text('Girum Ayele')),
                Expanded(child: Container())
              ],
            ),
          ),
          Card(
            shadowColor: Color(240),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                            onTap: () {},
                            title: Text('Match preferance'),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                            )),
                        ListTile(
                            onTap: () {},
                            title: Text('Photo'),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                            )),
                        ListTile(
                            onTap: () {},
                            title: Text('Bio'),
                            trailing: Icon(Icons.arrow_forward_ios_outlined))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BasicInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Info"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                      border: Border.all(color: Colors.black87)),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "First Name",
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                      border: Border.all(color: Colors.black87)),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last Name",
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Colors.black87)),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "email",
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Colors.black87)),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "I Live in ",
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Colors.black87)),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " Live  ",
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 120,
              height: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text("Update"),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.pinkAccent)),
            )
          ],
        ),
      ),
    );
  }
}

class Photos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Photos"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage('assets/images/a.jpg')),
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 80,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

var email = '';

class About extends StatelessWidget {
  static const routeName = "/aboutRoute";
  @override
  Widget build(BuildContext context) {
    print(getStringValuesSF);
    getStringValuesSF().then((news) {
      email = news;
    });
    // final args = ModalRoute.of(context)!.settings.arguments as User;
    // print('args: $args');
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),backgroundColor: Colors.pink,),
      body: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      if (state is UserOperationFailure) {
        return Text('opration failer');
      }
      if (state is UserLoadSuccess) {
        final users = state.users;
        return Container(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Image(image: AssetImage('assets/images/a.jpg'),height: 150,width: 100,),
                  Text("Girum Ayele")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Bio()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bio",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            print('ooooooooooooooooooooooooooo');
                            User usr = User('email', 'password');
                            // User lll(){
                            //   return
                            // }

                            for (int i = 0; i < users.length; i++) {
                              if (users[i].email == email) {
                                usr = users[i];
                                print(usr);
                              }
                            }
                            print(usr);
                            print('ppppppppppppppppppppppppppppp');
                            Navigator.of(context)
                                .pushNamed(UsrDetail.routeName, arguments: usr);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Basic Info",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              )
                            ],
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Photos()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Photos",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
      return CircularProgressIndicator();
    }));
  }
}

class Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Bio"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 20),
        child: ListView(
          children: [
            Text("How Would you describe yourself?"),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write a short bio",
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 50,
              height: 60,
              padding: EdgeInsets.only(left: 150),
              //padding: EdgeInsets.only(left: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text("Update"),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.pinkAccent)),
            )
          ],
        ),
      ),
    );
  }
}

// class CoursesList extends StatelessWidget {
//   static const routeName = '/';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List of Courses'),
//       ),
//       body: BlocBuilder<UserBloc, UserState>(
//         builder: (_, state) {
//           if (state is UserOperationFailure) {
//             return Text('Could not do course operation');
//           }

//           if (state is UserLoadSuccess) {
//             final courses = state.users;

//             return ListView.builder(
//               itemCount: courses.length,
//               itemBuilder: (_, idx) => ListTile(
//                 title: Text('${courses[idx].name}'),
//                 subtitle: Text('${courses[idx].username}'),
//                 // onTap: () => Navigator.of(context)
//                 //     .pushNamed(CourseDetail.routeName, arguments: courses[idx]),
//               ),
//             );
//           }

//           return CircularProgressIndicator();
//         },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () => Navigator.of(context).pushNamed(
//       //     AddUpdateCourse.routeName,
//       //     arguments: CourseArgument(edit: false),
//       //   ),
//       //   child: Icon(Icons.add),
//       // ),
//     );
//   }
// }

Future<dynamic> getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('em');

  return stringValue;
}
