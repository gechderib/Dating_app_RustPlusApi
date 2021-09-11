import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_register.dart';
import 'package:dating_app/user/widget/bottons.dart';
import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PageOne extends StatelessWidget { 
static const routeName = '/';

  PageOne({Key? key}) : super(key: key);
  final List<String> image_list = [
    "assets/images/a.jpg",
    "assets/images/pop.jpg",
    "assets/images/pp.jpg",
    "assets/images/ppp.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Don't be single any more",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 23,   
              ),
            ),
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 2,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayCurve: Curves.slowMiddle,
              enlargeCenterPage: false,
            ),
            items: image_list
                .map((item) => Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 500)),
                    ))
                .toList(),
          )),
          Hero(
            tag: "loginTag",
            child: CustomRoundButton(
              onPressedfun: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              backroundcolor: Colors.red,
              displaytext: Text(
                "Login",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Hero(
            tag: "Registertag",
            child: CustomRoundButton(
              onPressedfun: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterController()));
              },
              backroundcolor: Colors.blue,
              displaytext: Text(
                "Register",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
