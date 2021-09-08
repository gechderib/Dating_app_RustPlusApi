import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.labelText,
      this.suffixicondata,
      this.icondata,
      this.isValid,
      this.isObscure = false,
      required this.textEditingController})
      : super(key: key);
  final String labelText;
  final Icon? icondata;
  final Icon? suffixicondata;
  final String? Function(String?)? isValid;
  final bool isObscure;
  TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        controller: textEditingController,
        validator: isValid,
        obscureText:isObscure,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: icondata,
          suffix: suffixicondata,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }
}
