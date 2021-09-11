import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  CustomRoundButton({
    Key? key,
    required this.backroundcolor,
    required this.displaytext,
    required this.onPressedfun,
  }) : super(key: key);

  final Color backroundcolor;
  final Text displaytext;
  final Function() onPressedfun;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ElevatedButton(
        onPressed: onPressedfun,
        child: displaytext,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: backroundcolor,
        ),
      ),
    );
  }
}
