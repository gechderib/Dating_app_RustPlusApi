import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_list.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/widget/bottons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class AddUpdate extends StatelessWidget {
//   static const routeName = '/updateBasicInfo';
//   final UserRepository userRepository = UserRepository(
//       userDataProvider: UserDataProvider(httpClient: http.Client()));

//   @override
//   Widget build(BuildContext context) {
//     return BasicInfoAddUpdate(userRepository: userRepository);
//   }
// }

// class BasicInfoAddUpdate extends StatelessWidget {
//   final UserRepository userRepository;
//   BasicInfoAddUpdate({required this.userRepository});

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: this.userRepository,
//       child: BlocProvider(
//         create: (context) =>
//             UserBloc(userRepository: userRepository)..add(UserLoad()),
//         child:
//             AddUpdateUser(args: UserArgument(user: User('', ''), edit: true)),
//       ),
//     );
//   }
// }

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
        title: Text("Basic Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  decoration: InputDecoration(labelText: 'user name'),
                  onSaved: (value) {
                    setState(() {
                      this._user["name"] = value;
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.name : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'name'),
                  onSaved: (value) {
                    this._user["username"] = value;
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.address : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'addrsss'),
                  onSaved: (value) {
                    setState(() {
                      this._user["address"] = value;
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.email : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter user description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'descriptio'),
                  onSaved: (value) {
                    setState(() {
                      this._user["email"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.password : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter user description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'passwod'),
                  onSaved: (value) {
                    setState(() {
                      this._user["password"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.age : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter user age';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'age'),
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
                                  choiceAge: '',sex: '',color: '',religion: ''),
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          UserList.routeName, (route) => false);
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
