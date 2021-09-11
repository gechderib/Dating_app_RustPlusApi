import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/addApdate.dart';
import 'package:dating_app/user/screens/home.dart';
import 'package:dating_app/user/screens/i_liked.dart';
import 'package:dating_app/user/screens/liked_me.dart';
import 'package:dating_app/user/screens/nn.dart';
import 'package:dating_app/user/screens/page1.dart';
import 'package:dating_app/user/screens/setting.dart';
import 'package:dating_app/user/screens/suggestion.dart';
import 'package:dating_app/user/screens/user_detail.dart';
import 'package:dating_app/user/screens/user_list.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_register.dart';
import 'package:dating_app/user/screens/usrchoice.dart';
import 'package:dating_app/user/screens/usrdt.dart';
import 'package:dating_app/user/screens/wellcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatingAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => PageOne());
    }
    if (settings.name == HomePage.routeName) {
      return MaterialPageRoute(builder: (context) => HomePage());
    }
    if (settings.name == WellcomeScreen.routeName) {
      return MaterialPageRoute(builder: (context) => WellcomeScreen());
    }
    if (settings.name == RegisterController.routeName) {
      return MaterialPageRoute(builder: (context) => RegisterController());
    }
    if (settings.name == LoginPage.routeName) {
      return MaterialPageRoute(builder: (context) => LoginPage());
    }
    if (settings.name == UsrDetail.routeName) {
      User user = settings.arguments as User;
      return MaterialPageRoute(builder: (context) => UsrDetail(user: user));
    }
    // if (settings.name == UserList.routeName) {
    //   return MaterialPageRoute(builder: (context) => UserList());
    // }
    if (settings.name == UserDetail.routeName) {
      User user = settings.arguments as User;
      return MaterialPageRoute(builder: (context) => UserDetail(user));
    }

    if (settings.name == About.routeName) {
      return MaterialPageRoute(builder: (context) => About());
    }
    if (settings.name == AddUpdateUser.routeName) {
      UserArgument args = settings.arguments as UserArgument;
      return MaterialPageRoute(
        builder: (context) => AddUpdateUser(
          args: args,
        ),
      );
    }
    if (settings.name == UserChoicAddUpdate.routeName) {
      UserArgument args = settings.arguments as UserArgument;
      return MaterialPageRoute(
        builder: (context) => UserChoicAddUpdate(
          args: args,
        ),
      );
    }
    if (settings.name == likedme.routeName) {
      return MaterialPageRoute(builder: (context) => likedme());
    }
    if (settings.name == Settings.routeName) {
      return MaterialPageRoute(builder: (context) => Settings());
    }
    if (settings.name == iliked.routeName) {
      return MaterialPageRoute(builder: (context) => iliked());
    }
    // if (settings.name == UserDetail.routeName) {

    //   return MaterialPageRoute(
    //       builder: (context) => UserDetail(settings.arguments));
    // }
    if (settings.name == Suggetion.routeName) {
      return MaterialPageRoute(builder: (context) => Suggetion());
    }
    return MaterialPageRoute(builder: (context) => PageOne());
  }
}

class UserArgument {
  User user;
  final bool edit;
  UserArgument({required this.user, required this.edit});
}
