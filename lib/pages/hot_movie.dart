import 'package:flutter/material.dart';

class HotMovie extends StatefulWidget {
  @override
  HotMovieState createState() => HotMovieState();
}

class HotMovieState extends State<HotMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("热映"),
      ),
    );
  }
}
