import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTile extends StatelessWidget {
  final String title;
  final double paddingLeft;
  final double paddingRight;
  final Image image;
  final double height;

  ListTile(
      {this.title,
      this.paddingLeft,
      this.paddingRight,
      this.image,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: ScreenUtil().setHeight(this.height),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: ScreenUtil().setWidth(this.paddingLeft)),
          ),
          Text(this.title),
          Image.asset("images/ic_back.png"),
          Padding(
            padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(this.paddingRight)),
          )
        ],
      ),
    );
  }
}
