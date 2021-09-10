import 'package:dating_app/user/screens/home.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatelessWidget {
  static const routeName = '/userlogin';
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextField(),
                TextField(),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
            child: Text('login'),
          ),
        ],
      ),
    );
  }
}
