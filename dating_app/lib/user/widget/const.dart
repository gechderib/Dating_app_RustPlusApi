import 'package:flutter/material.dart';

const InputFieldStyle = InputDecoration(
  hintText: 'Age',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red), gapPadding: 12),
);
