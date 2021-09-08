import 'dart:html';

import 'package:dating_app/user/bloc/login/login_bloc.dart';
import 'package:dating_app/user/bloc/login/login_event.dart';
import 'package:dating_app/user/bloc/login/login_state.dart';
import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/models/loginModel.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/addApdate.dart';
import 'package:dating_app/user/screens/home.dart';
import 'package:dating_app/user/screens/nn.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/widget/bottons.dart';
import 'package:dating_app/user/widget/textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  LoginPage({Key? key}) : super(key: key);

  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String roleDropDownValue = 'User';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (_, state) {
      if (state is Logedin) {
        emailCont.text = "";
        passwordCont.text = "";
        // var currentuser =
        //     state.loggedinUserinfo.tojson();
        // String name = currentuser['name'];

        // if (role == "Representative") {
        //   Navigator.pushNamed(context, '/repmainscreen');
        // } else if (role == "User") {

        // BlocProvider.of<HolyPlaceBloc>(context)
        //     .add(LoadingHolyPlacesEvent());
        Navigator.pushNamed(context, HomePage.routeName);
        // } else if (role == "Admin") {
        //   Navigator.pushNamed(context, '/adminpage');
        // }

      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
            title: Text("Login"),
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white),
        body: Center(
          child: Stack(
            children: [
              Image.asset("assets/images/op.jpeg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover),
              ListView(
                shrinkWrap: false,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                        child: Text(
                          'Log in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 40, 0, 0),
                        child: Text(
                          '.',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextField(
                          isValid: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return "Email is not valid";
                            }
                            return null;
                          },
                          labelText: "Email Address",
                          textEditingController: emailCont,
                          icondata: Icon(Icons.email),
                        ),
                        CustomTextField(
                          isValid: (value) {
                            if (value!.isEmpty) {
                              return "password is required";
                            }
                            return null;
                          },
                          labelText: "Password",
                          textEditingController: passwordCont,
                          icondata: Icon(Icons.password),
                        ),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (_, state) {},
                          builder: (_, state) {
                            if (state is Loging) {
                              return SpinKitDualRing(
                                color: Colors.black,
                                size: 50,
                              );
                            }
                            if (state is FaildLoging) {
                              // Navigator.pushNamed(context, AddUpdateUser.routeName);
                              return Text(
                                "Email or password incorrect!",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red),
                              );
                            }
                            return Hero(
                              tag: "loginTag",
                              child: CustomRoundButton(
                                onPressedfun: () async {
                                  var form = _formKey.currentState;
                                  if (form!.validate()) {
                                    LoginModel loginModel = LoginModel(
                                        emailCont.text, passwordCont.text);
                                    LoginEvent loginEvent =
                                        LogingUserEvent(loginModel);
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(loginEvent);
                                  }
                                },
                                backroundcolor: Colors.redAccent,
                                displaytext: Text(
                                  "Log in ",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                            AddUpdateUser.routeName,
                            arguments: UserArgument(
                                user: User('email', 'password',
                                    username: 'username',
                                    name: 'name',
                                    address: 'address'),
                                edit: true),
                          ),
                          child: Text('press me'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, HomePage.routeName);
                          },
                          child: Text('home'),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, HomePage.routeName);
                            },
                            child: Text('jjjj'))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
