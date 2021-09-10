// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/addApdate.dart';
import 'package:dating_app/user/screens/user_detail.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dating_app/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

void main() {
  UserArgument usr = UserArgument(user: User('', ''), edit: true);
  testWidgets('my widget have a user and a bool value', (WidgetTester tester) async {
    await tester.pumpWidget(AddUpdateUser(args: usr));
    final userFinder = find.byElementType(User);
    final userEditOrUpdate = find.byType(bool);

    expect(userFinder, findsOneWidget);
    expect(userEditOrUpdate, findsOneWidget);
  });

    testWidgets('my widget have take a user', (WidgetTester tester) async {
    await tester.pumpWidget(UserDetail(User('email', 'password')));
    final userFinder = find.byElementType(User);
    expect(userFinder, findsOneWidget);

    tester.enterText(, text)
  });


}
