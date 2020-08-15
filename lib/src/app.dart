import 'package:flutter/cupertino.dart';
import 'package:apod_app/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Apod App',
      home: HomeScreen(),
    );
  }
}