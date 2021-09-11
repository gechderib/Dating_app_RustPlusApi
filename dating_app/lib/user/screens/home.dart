import 'package:dating_app/user/screens/i_liked.dart';
import 'package:dating_app/user/screens/liked_me.dart';
import 'package:dating_app/user/screens/nn.dart';
import 'package:dating_app/user/screens/setting.dart';
import 'package:dating_app/user/screens/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var username = "";

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pages = <Widget>[
    Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
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
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {},
              child: Text('$username'),
            )
          ],
        ),
        body: TabBarView(children: <Widget>[Suggetion(), iliked(), likedme()])),

    About(), 
    Settings()
    //this is a stateful widget on a separate file
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.pink),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'About',
                  backgroundColor: Colors.pink),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
                backgroundColor: Colors.pink,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            iconSize: 25,
            onTap: _onItemTapped,
            elevation: 5),
      ),
    );
  }

  Future<dynamic> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('em');

    return stringValue;
  }
}
