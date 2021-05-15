import 'package:flutter/material.dart';
import 'homePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My BLOC employee app',
      theme: ThemeData(
          primarySwatch: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
