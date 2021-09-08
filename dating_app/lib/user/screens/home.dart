import 'dart:html';

import 'package:dating_app/user/screens/i_liked.dart';
import 'package:dating_app/user/screens/liked_me.dart';
import 'package:dating_app/user/screens/nn.dart';
import 'package:dating_app/user/screens/suggestion.dart';
import 'package:dating_app/user/screens/user_register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var username = "";

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    print("kidus");
    print(getStringValuesSF);
    getStringValuesSF().then((news) {
      username = news;
    });
    print(username);

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Matches"),
                Tab(text: "I liked"),
                Tab(text: "Liked Me"),
              ],
              unselectedLabelColor: Colors.yellow,
            ),
            title: Text('Dating App'),
            actions: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.circle),
                  label: Text(username)),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.circle),
                  label: Text(username)),
            ],
          ),
          body:
              TabBarView(children: <Widget>[Suggetion(), iliked(), likedme()]),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 2,
              items: <BottomNavigationBarItem>[
                
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterController.routeName);
                        },
                        child: Text('Home')),
                    backgroundColor: Colors.green),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text('Search'),
                    backgroundColor: Colors.yellow),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  backgroundColor: Colors.blue,
                ),
              ],
              type: BottomNavigationBarType.shifting,
              // currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              iconSize: 40,
              // onTap: _onItemTapped,
              elevation: 5),
        ));
  }

  Future<dynamic> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('em');

    return stringValue;
  }
}
