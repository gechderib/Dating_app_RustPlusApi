import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdateUser extends StatefulWidget {
  static const routeName = 'userAddUpdate';
  final UserArgument args;

  AddUpdateUser({required this.args});
  @override
  _AddUpdateUserState createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUser> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    initialValue: widget.args.edit ? widget.args.user.name : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Full Name'),
                    onSaved: (value) {
                      setState(() {
                        this._user["name"] = value;
                        print(this._user['name']);
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.username : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'username'),
                    onSaved: (value) {
                      setState(() {
                        this._user["username"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.email : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'address'),
                    onSaved: (value) {
                      setState(() {
                        this._user["address"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.address : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'email'),
                    onSaved: (value) {
                      setState(() {
                        this._user["email"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.address : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'password'),
                    obscureText: true,
                    onSaved: (value) {
                      setState(() {
                        this._user["password"] = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        final UserEvent event = widget.args.edit
                            ? UserUpdate(
                                User(
                                    id: widget.args.user.id,
                                    username: this._user['username'],
                                    name: this._user['name'],
                                    email: this._user['email'],
                                    password: this._user['password'],
                                    address: this._user['address']),
                              )
                            : UserCreate(
                                User(
                                    id: widget.args.user.id,
                                    username: this._user['username'],
                                    name: this._user['name'],
                                    email: this._user['email'],
                                    password: this._user['password'],
                                    address: this._user['address']),
                              );
                        print(event);
                        BlocProvider.of<UserBloc>(context).add(event);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            UserLogin.routeName, (route) => false);
                      }
                    },
                    label: Text('Register'),
                    icon: Icon(Icons.app_registration_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
