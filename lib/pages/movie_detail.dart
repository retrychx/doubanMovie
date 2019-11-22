import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetail extends StatefulWidget {
  final String id;
  MovieDetail(@required this.id);
  @override
  MovieDetailState createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
        centerTitle: true,
      ),
      body: Text("测试"),
    );
  }

  Widget getTitle() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.fastfood,
          size: ScreenUtil().setWidth(80),
        ),
        Text(
          "电影",
          style: TextStyle(fontSize: ScreenUtil().setSp(50)),
        )
      ],
    );
  }
}
