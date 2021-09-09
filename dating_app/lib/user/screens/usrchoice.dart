import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_list.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/widget/bottons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserChoicAddUpdate extends StatefulWidget {
  static const routeName = '/usrChoiceAddUpdate';
  final UserArgument args;

  UserChoicAddUpdate({required this.args});
  @override
  _UserChoicAddUpdateState createState() => _UserChoicAddUpdateState();
}

class _UserChoicAddUpdateState extends State<UserChoicAddUpdate> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("to who you wanna to date"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.choiceAge : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter choice age';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Age'),
                    onSaved: (value) {
                      setState(() {
                        this._user["choiceAge"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.color : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter his/her color';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'color'),
                    onSaved: (value) {
                      this._user["color"] = value;
                    }),
                TextFormField(
                    initialValue: widget.args.edit ? widget.args.user.sex : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter gender';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Gender'),
                    onSaved: (value) {
                      setState(() {
                        this._user["sex"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.user.religion : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter religion';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Religion'),
                    onSaved: (value) {
                      setState(() {
                        this._user["religion"] = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomRoundButton(
                    onPressedfun: () {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        final UserEvent event = widget.args.edit
                            ? UserUpdate(
                                User(widget.args.user.email,
                                    widget.args.user.password,
                                    id: widget.args.user.id,
                                    name: widget.args.user.name,
                                    username: widget.args.user.username,
                                    address: widget.args.user.address,
                                    age: widget.args.user.age,
                                    like: 'null',
                                    image: 'image',
                                    choiceAge: this._user['choiceAge'],
                                    sex: this._user['sex'],
                                    color: this._user['color'],
                                    religion: this._user['religion']),
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
                        Navigator.of(context)
                            .pushNamed(UserChoicAddUpdate.routeName);
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
      ),
    );
  }
}
