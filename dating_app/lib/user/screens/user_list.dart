import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/addApdate.dart';
import 'package:dating_app/user/screens/user_detail.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class UserList extends StatelessWidget {
//   static const routeName = '/userList';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List of User'),
//       ),
//       body: BlocBuilder<UserBloc, UserState>(
//         builder: (_, state) {
//           if (state is UserOperationFailure) {
//             return Text('Could not do User operation');
//           }

//           if (state is UserLoadSuccess) {
//             final users = state.users;

//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (_, idx) => ListTile(
//                 title: Text('${users[idx].name}'),
//                 subtitle: Text('${users[idx].username}'),
//                 onTap: () => Navigator.of(context)
//                     .pushNamed(UserDetail.routeName, arguments: users[idx]),
//               ),
//             );
//           }

//           return CircularProgressIndicator();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.of(context).pushNamed(
//           AddUpdateUser.routeName,
//           arguments: UserArgument(user: User('email', 'password'), edit: true),
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
