import 'package:flutter/material.dart';
import 'package:douban/pages/about_me.dart';
import 'package:douban/pages/find_movie.dart';
import 'package:douban/pages/hot_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:douban/utils/hex_color.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final titles = ["热映", "找片", "我的"];
  final pages = [HotMovie(), FindMovie(), AboutMe()];
  final tabTextStyleselected =
      TextStyle(color: HexColor("#515151"), fontSize: ScreenUtil().setSp(38));
  final tabTextStyleNormal =
      TextStyle(color: HexColor("#696969"), fontSize: ScreenUtil().setSp(38));

  int currentIndex = 0;
  var tabImages;
  var body;

  @override
  void initState() {
    super.initState();

    if (tabImages == null) {
      tabImages = [
        [
          getTabImage("images/ic_hot_play_unselected.png"),
          getTabImage("images/ic_hot_play_selected.png")
        ],
        [
          getTabImage("images/ic_find_movie_unselected.png"),
          getTabImage("images/ic_find_movie_selected.png")
        ],
        [
          getTabImage("images/ic_account_unselected.png"),
          getTabImage("images/ic_account_selected.png")
        ],
      ];
    }
  }

  Image getTabIcon(int index) {
    if (currentIndex == index) {
      return tabImages[index][1];
    }

    return tabImages[index][0];
  }

  Image getTabImage(path) {
    return Image.asset(path,
        width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50));
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == currentIndex) {
      return tabTextStyleselected;
    }

    return tabTextStyleNormal;
  }

  Text getTabTitle(int curIndex) {
    return Text(titles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    body = IndexedStack(children: pages, index: currentIndex);

    return Scaffold(
      body: body,
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
