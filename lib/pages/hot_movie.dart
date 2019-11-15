import 'package:douban/pages/future_play.dart';
import 'package:douban/pages/hot_play.dart';
import 'package:douban/widgets/my_scroll_behavior.dart';
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
  PageController pageController;
  final tabTitles = [Text("正在热映"), Text("即将上映")];
  final pages = [HotPlay(), FuturePlay()];
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    tabController = TabController(
        length: tabTitles.length, initialIndex: currentPage, vsync: this);
    pageController = PageController(initialPage: currentPage, keepPage: true);
    return Scaffold(
      appBar: AppBarContainer(
        height: ScreenUtil.instance.setHeight(180),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(25),
                  right: ScreenUtil.instance.setWidth(25)),
              width: double.infinity,
              height: ScreenUtil.instance.setHeight(100),
              child: SearchWidget(),
            ),
            TabBar(
              controller: tabController,
              tabs: tabTitles,
              isScrollable: false,
              indicatorColor: Color.fromARGB(255, 51, 51, 51),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10),
                  top: ScreenUtil.instance.setWidth(10)),
              unselectedLabelColor: Color.fromARGB(100, 51, 51, 51),
              unselectedLabelStyle: TextStyle(
                fontSize: ScreenUtil.instance.setSp(28),
                fontWeight: FontWeight.bold,
              ),
              labelColor: Color.fromARGB(255, 51, 51, 51),
              labelStyle: TextStyle(
                fontSize: ScreenUtil.instance.setSp(28),
                fontWeight: FontWeight.bold,
              ),
              onTap: (index) {
                currentPage = index;
                pageController.jumpToPage(index);
              },
            ),
            Container(
              height: ScreenUtil.instance.setHeight(1),
              color: Color.fromARGB(100, 167, 161, 164),
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: PageView(
          controller: pageController,
          children: pages,
          onPageChanged: (index) {
            currentPage = index;
            tabController.animateTo(index);
          },
        ),
      ),
    );
  }
}
