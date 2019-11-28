import 'package:douban/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:douban/utils/hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMe extends StatefulWidget {
  @override
  AboutMeState createState() => AboutMeState();
}

class AboutMeState extends State<AboutMe> {
  final tabTitles = ["想看", "在看", "看过", "影评", "影人"];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[header(), tabs()],
    ));
  }

  Widget tabs() {
    return Container(
        width: double.infinity,
        height: ScreenUtil().setWidth(150),
        child: DefaultTabController(
          length: tabTitles.length,
          child: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorWeight: 1,
            labelStyle: TextStyle(
              fontSize: ScreenUtil().setSp(40),
            ),
            tabs: <Widget>[
              Text("想看"),
              Text("在看"),
              Text("看过"),
              Text("影评"),
              Text("影人"),
            ],
          ),
        ));
  }

  Widget header() {
    return Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(400),
        color: HexColor("#005500"),
        child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(140)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              login(),
              IconButton(
                onPressed: getSetting,
                iconSize: ScreenUtil().setWidth(10),
                icon: Image.asset("images/ic_setting.png",
                    color: Colors.white,
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setWidth(60)),
              )
            ],
          ),
        ));
  }

  void getSetting() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SettingPage();
    }));
  }

  Widget login() {
    return Container(
        child: GestureDetector(
      child: Row(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(50), top: ScreenUtil().setWidth(0)),
          child: ClipOval(
              child: Image.asset(
            "images/ic_head_pla.png",
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setWidth(200),
          )),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30), top: ScreenUtil().setWidth(0)),
            child: Text(
              "未登录",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(42)),
            ))
      ]),
    ));
  }
}
