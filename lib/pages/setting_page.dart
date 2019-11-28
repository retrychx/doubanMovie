import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/hex_color.dart';
import 'package:douban/widgets/cell_tile.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(150)),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: HexColor("#ffffff"),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("设置",
              style: TextStyle(
                  color: Colors.black87, fontSize: ScreenUtil().setSp(44))),
        ),
      ),
      body: Container(
        color: HexColor("#efefef"),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(100)),
            ),
            CellTile(
              cellheight: ScreenUtil().setWidth(120),
              title: "账号与安全",
              paddingLeft: ScreenUtil().setWidth(60),
              paddingRight: ScreenUtil().setWidth(0),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(100)),
            ),
            CellTile(
              cellheight: ScreenUtil().setWidth(120),
              title: "意见反馈",
              paddingLeft: ScreenUtil().setWidth(60),
              paddingRight: ScreenUtil().setWidth(0),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(1),
              color: Color.fromARGB(100, 167, 161, 164),
            ),
            CellTile(
              cellheight: ScreenUtil().setWidth(120),
              title: "给应用评分",
              paddingLeft: ScreenUtil().setWidth(60),
              paddingRight: ScreenUtil().setWidth(0),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(1),
              color: Color.fromARGB(100, 167, 161, 164),
            ),
            CellTile(
              cellheight: ScreenUtil().setWidth(120),
              title: "清除缓存",
              paddingLeft: ScreenUtil().setWidth(60),
              paddingRight: ScreenUtil().setWidth(0),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(1),
              color: Color.fromARGB(100, 167, 161, 164),
            ),
            CellTile(
              cellheight: ScreenUtil().setWidth(120),
              title: "关于",
              paddingLeft: ScreenUtil().setWidth(60),
              paddingRight: ScreenUtil().setWidth(0),
            ),
          ],
        ),
      ),
    );
  }
}
