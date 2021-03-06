import 'package:dating_app/user/bloc/login/login_bloc.dart';
import 'package:dating_app/user/bloc/login/login_state.dart';
import 'package:dating_app/user/screens/home.dart';
import 'package:dating_app/user/screens/nn.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Settings'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              titlePadding: EdgeInsets.all(20),
              title: 'Section 1',
              tiles: [
                SettingsTile(
                  title: 'Profile',
                  subtitle: 'Edit profile',
                  leading: Icon(Icons.edit),
                  onPressed: (BuildContext context) {
                    Navigator.pushNamed(context, About.routeName);
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Use System Theme',
                  leading: Icon(Icons.phone_android),
                  switchValue: isSwitched,
                  onToggle: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            SettingsSection(
              titlePadding: EdgeInsets.all(20),
              title: 'Section 2',
              tiles: [
                SettingsTile(
                  title: 'Home',
                  subtitle: 'Home page',
                  leading: Icon(Icons.home),
                  onPressed: (BuildContext context) {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  switchValue: true,
                  onToggle: (value) {},
                ),
              ],
            ),
            SettingsSection(
              titlePadding: EdgeInsets.all(20),
              title: 'Section 2',
              tiles: [
                SettingsTile(
                  title: 'logout',
                  subtitle: 'Logout from page',
                  leading: Icon(Icons.logout),
                  onPressed: (BuildContext context) {
                    // addStringToSF();

                    addStringToSF(email) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('em');
                      Navigator.pushNamed(context, LoginPage.routeName);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
