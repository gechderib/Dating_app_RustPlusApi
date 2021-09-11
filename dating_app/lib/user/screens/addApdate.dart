import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/home.dart';
import 'package:dating_app/user/screens/user_list.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/widget/bottons.dart';
import 'package:dating_app/user/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdateUser extends StatefulWidget {
  static const routeName = '/addUpdate';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Basic Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.username : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter user name';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Full Name', hintText: 'Your name'),
                  onSaved: (value) {
                    setState(() {
                      this._user["name"] = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.name : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Username', hintText: 'your username'),
                  onSaved: (value) {
                    this._user["username"] = value;
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.address : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      hintText: 'your address', labelText: 'Address'),
                  onSaved: (value) {
                    setState(() {
                      this._user["address"] = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.email : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Email', hintText: 'your email'),
                  onSaved: (value) {
                    setState(() {
                      this._user["email"] = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.password : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      hintText: 'your password', labelText: 'Password'),
                  onSaved: (value) {
                    setState(() {
                      this._user["password"] = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.age : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter user age';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Age', hintText: 'your age age'),
                  onSaved: (value) {
                    setState(() {
                      this._user["age"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomRoundButton(
                  onPressedfun: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      print('ooooooooooooooooooooooooooooppppppppppppp');
                      print(this._user['age']);
                      print(this._user['username']);
                      final UserEvent event = widget.args.edit
                          ? UserUpdate(
                              User(widget.args.user.email,
                                  this._user["password"],
                                  id: widget.args.user.id,
                                  name: this._user["name"],
                                  username: this._user["username"],
                                  address: this._user["address"],
                                  age: this._user['age'],
                                  like: 'null',
                                  image: 'image',
                                  choiceAge: '',
                                  sex: '',
                                  color: '',
                                  religion: ''),
                            )
                          : UserCreate(
                              User(
                                this._user["email"],
                                this._user['password'],
                                name: this._user["name"],
                                username: this._user["username"],
                                address: this._user["address"],
                              ),
                            );

                      BlocProvider.of<UserBloc>(context).add(event);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Update!!"),
                            content:
                                new Text("You success fully updated your info"),
                            actions: <Widget>[
                              new TextButton(
                                child: new Text("back to home"),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, HomePage.routeName);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  displaytext: Text('SAVE'),
                  backroundcolor: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
