import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var typee = "lala";

class Suggetion extends StatelessWidget {
  static const routeName = '/suggestion';

  @override
  Widget build(BuildContext context) {
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
                  var a = typee;
                  print("this is " + a);
                  final users = state.users;
                  List<User> suggest = [];
                  for (var i = 0; i < users.length; i++) {
                    if (users[i].age == '22') {
                      suggest.add(users[i]);
                    }
                  }
                  return Expanded(
                    child: list_widget(users: suggest),
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
}

class list_widget extends StatelessWidget {
  const list_widget({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        //itemBuilder: (_, idx) =>
        itemBuilder: (_, idx) {
          return Card(
              // In many cases, the key isn't mandatory
              key: UniqueKey(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('${users[idx].name}'),
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
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${users[idx].address}',
                                style: TextStyle(fontSize: 30),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.pink),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      UserDetail.routeName,
                                      arguments: users[idx]);
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

// class TabBar extends StatelessWidget {
//   const TabBar({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           children: [
//             Container(
//               child: Center(
//                 child: Text("2"),
//               ),
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.yellow),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text("Matches"),
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Text(""),
//             TextButton(
//                 onPressed: () {
//                   typee = "i_like";
//                 },
//                 child: Text("I Liked"))
//           ],
//         ),
//         Column(
//           children: [
//             Text(""),
//             TextButton(onPressed: () {}, child: Text("Liked Me"))
//           ],
//         ),
//         Column(
//           children: [
//             Container(
//               child: Center(
//                 child: Text("1"),
//               ),
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.yellow),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text("Admires"),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }

class ffg extends StatelessWidget {
  const ffg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
