import 'package:douban/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:douban/widgets/app_bar_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotMovie extends StatefulWidget {
  @override
  HotMovieState createState() => HotMovieState();
}

class HotMovieState extends State<HotMovie> with TickerProviderStateMixin {
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    return Scaffold(
        appBar: AppBarContainer(
      height: ScreenUtil.instance.setHeight(168),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(25),
                right: ScreenUtil.instance.setWidth(25)),
            width: double.infinity,
            height: ScreenUtil.instance.setHeight(100),
            child: SearchWidget(),
          )
        ],
      ),
    ));
  }
}
