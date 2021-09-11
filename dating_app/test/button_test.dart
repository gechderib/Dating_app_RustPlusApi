import 'package:dating_app/user/models/user.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:dating_app/user/screens/usrchoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('flutter test for login page', (WidgetTester tester) async {
    await tester.pumpWidget(LoginPage());
    var textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);

    tester.enterText(textField, 'username');
    expect(find.text('username'), findsOneWidget);
    print('username');

    var button = find.text("login");
    expect(button, findsOneWidget);
    print('login');
    await tester.tap(button);
    await tester.pump();
    expect(find.text("username"), findsOneWidget);
    print('username');
  });
}

void widgetTest() {
  testWidgets('find text in widget', (WidgetTester tester) async {
    await tester.pumpWidget(UserChoicAddUpdate(
        args: UserArgument(user: User('email', 'password'), edit: true)));

    var textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);

    tester.enterText(textField, 'username');
    expect(find.text('username'), findsOneWidget);
    print('username');
  });
}


// void main() {
//   // Define a test. The TestWidgets function also provides a WidgetTester
//   // to work with. The WidgetTester allows building and interacting
//   // with widgets in the test environment.
//   testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
//     // Create the widget by telling the tester to build it.
//     await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

//     // Create the Finders.
//     final titleFinder = find.text('T');
//     final messageFinder = find.text('M');

//     // Use the `findsOneWidget` matcher provided by flutter_test to
//     // verify that the Text widgets appear exactly once in the widget tree.
//     expect(titleFinder, findsOneWidget);
//     expect(messageFinder, findsOneWidget);
//   });
// }

