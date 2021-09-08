import 'package:dating_app/user/screens/i_liked.dart';
import 'package:dating_app/user/screens/liked_me.dart';
import 'package:dating_app/user/screens/nn.dart';
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
    
      body: TabBarView(children: <Widget>[Suggetion(), iliked(), likedme()])
    ),

    About(), //this is a stateful widget on a separate file
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
                    title: Text('Home'),
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
              selectedItemColor: Colors.black,
              iconSize: 30,
              onTap: _onItemTapped,
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
