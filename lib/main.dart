import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amely",
      theme: ThemeData(
          textTheme: TextTheme(body1:  TextStyle(fontSize: 20.0),
              caption: TextStyle(fontSize: 20.0),
              title: TextStyle(fontSize: 20.0),
              headline:  TextStyle(fontSize: 25.0),
              subhead: TextStyle(fontSize: 20.0),
              button: TextStyle(fontSize: 20.0))),
      home: Scaffold(
        body: Login(),
      ),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new Login(),
//        '/home': (BuildContext context) => new Home(_token),
      },
    );
  }
}
