import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/hex_color.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: HexColor("#ffffff"),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("设置", style: TextStyle(color: Colors.black87)),
      ),
      body: Container(
        color: HexColor("#efefef"),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(100)),
            ),
            Container(
              height: ScreenUtil().setWidth(100),
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    EdgeInsets.only(left: ScreenUtil().setWidth(70)),
                title: Text("帐号与安全"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
