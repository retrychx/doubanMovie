import 'package:flutter/material.dart';
import 'package:douban/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '豆瓣电影',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashPage());
  }
}
