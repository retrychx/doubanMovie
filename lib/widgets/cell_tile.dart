import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:douban/utils/hex_color.dart';

class CellTile extends StatelessWidget {
  final String title;
  final double paddingLeft;
  final double paddingRight;
  final Image image;
  final double cellheight;
  final GestureTapCallback onClick;

  CellTile(
      {this.title,
      this.paddingLeft,
      this.paddingRight,
      this.image,
      this.cellheight,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onClick,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: this.cellheight,
        padding:
            EdgeInsets.only(left: this.paddingLeft, right: this.paddingRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(fontSize: ScreenUtil().setSp(44)),
            ),
            Container(
                padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
                child: Transform(
                  alignment: FractionalOffset.center,
                  child: Image.asset(
                    "images/ic_back.png",
                    color: HexColor("#666666"),
                  ),
                  transform: Matrix4.identity()..rotateY(pi),
                )),
          ],
        ),
      ),
    );
  }
}
