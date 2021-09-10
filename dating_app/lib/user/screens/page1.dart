import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_register.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  static const routeName = '/';
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, UserLogin.routeName);
            },
            child: Text('login'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddUpdateUser.routeName);
            },
            child: Text('register'),
          )
        ],
      ),
    );
  }
}
