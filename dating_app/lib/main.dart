import 'package:dating_app/bloc_observer.dart';
import 'package:dating_app/user/bloc/login/login_bloc.dart';
import 'package:dating_app/user/bloc/register/register_bloc.dart';
import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/data_provider/user_data.dart';
import 'package:dating_app/user/repository/user_repository.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/screens/wellcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SampleObsever();
  final UserRepository userRepository = UserRepository(
      userDataProvider: UserDataProvider(httpClient: http.Client()));

  runApp(AppStarter(userRepository: userRepository));
  // runApp(MaterialApp(home: AddUpdateUser(args: UserArgument(user: User('email', 'password'), edit: false))));
}

class AppStarter extends StatelessWidget {
  final UserRepository userRepository;
  const AppStarter({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.userRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
          BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc(),
          ),
          BlocProvider(create: (context)=>UserBloc(userRepository: userRepository)..add(UserLoad()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Dating app",
          initialRoute: WellcomeScreen.routeName,
          onGenerateRoute: DatingAppRoute.generateRoute,
        ),
      ),
    );
  }
}
