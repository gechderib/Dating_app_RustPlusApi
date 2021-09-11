import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/widget/bottons.dart';
import 'package:dating_app/user/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserChoicAddUpdate extends StatefulWidget {
  static const routeName = '/addUpdooate';
  final UserArgument args;

  UserChoicAddUpdate({required this.args});
  @override
  _UserChoicAddUpdateState createState() => _UserChoicAddUpdateState();
}

class _UserChoicAddUpdateState extends State<UserChoicAddUpdate> {
  final _formKey = GlobalKey<FormState>();
  RangeValues _currentRangeValues = const RangeValues(20, 30);

  final Map<String, dynamic> _user = {};

  String addUpdate = 'Add Choice';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Dating preference"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Preferance age range', style: TextStyle(color: Colors.pink,fontSize: 12),),
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 25,
                activeColor: Colors.pink,
                inactiveColor: Colors.pinkAccent,
                labels: RangeLabels(
                  'Age From:${_currentRangeValues.start.round().toString()}',
                  'To${_currentRangeValues.end.round().toString()}',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                    this._user['choiceAge'] =
                        'from:${_currentRangeValues.start} to ${_currentRangeValues.end}';
                    print(this._user['choiceAge']);
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.sex : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter choice gender';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Choice Gender',
                      hintText: 'pereferance gender'),
                  onSaved: (value) {
                    this._user["sex"] = value;
                  }),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.color : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter choice color';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Choice color',
                      hintText: 'your pereferance color'),
                  onSaved: (value) {
                    setState(() {
                      this._user["color"] = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.religion : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter choice religion';
                    }
                    return null;
                  },
                  decoration: InputFieldStyle.copyWith(
                      labelText: 'Choice religion',
                      hintText: 'preference religion'),
                  onSaved: (value) {
                    setState(() {
                      this._user["religion"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomRoundButton(
                        backroundcolor: Colors.pink,
                        displaytext: Text('Delete'),
                        onPressedfun: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Delete!!",
                                    style: TextStyle(
                                      color: Colors.red,
                                    )),
                                content:  Text("Are you sure about it ?.."),
                                actions: <Widget>[
                                   TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child:  Text("Yes",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    onPressed: () {
                                      BlocProvider.of<UserBloc>(context).add(
                                        UserUpdate(
                                          User(
                                            widget.args.user.email,
                                            widget.args.user.password,
                                            id: widget.args.user.id,
                                            name: widget.args.user.name,
                                            username: widget.args.user.username,
                                            address: widget.args.user.address,
                                            age: widget.args.user.age,
                                            like: 'null',
                                            image: 'image',
                                            choiceAge: '',
                                            sex: '',
                                            color: '',
                                            religion: '',
                                          ),
                                        ),
                                      );
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) =>
                                      //             super.widget));
                                    },
                                  ),
                                  new TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.pinkAccent),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
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
                            setState(() {
                              addUpdate = 'Update Choice';
                            });
                          }
                        },
                        displaytext: Text('$addUpdate'),
                        backroundcolor: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}