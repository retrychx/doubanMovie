import 'package:douban/models/movie_detail_model.dart';
import 'package:douban/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:douban/utils/hex_color.dart';

class MovieHeader extends StatelessWidget {
  final MovieDetaiModel model;
  MovieHeader({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(30),
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30)),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[getContent(), headerStar()],
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(30),
                bottom: ScreenUtil().setWidth(30)),
            height: ScreenUtil.instance.setHeight(1),
            color: Color.fromARGB(100, 167, 161, 164),
          ),
          getInfo()
        ]));
  }

  Widget headerStar() {
    return Container(
      width: ScreenUtil().setWidth(220),
      height: ScreenUtil().setWidth(210),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: HexColor("#dddddd"),
            offset: Offset(0.1, 0.5),
            spreadRadius: 1.4)
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "豆瓣评分",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28), color: HexColor("#AAAAAA")),
          ),
          Text(
            model.rating.average.toString(),
            style: TextStyle(
                fontSize: ScreenUtil().setSp(50), fontWeight: FontWeight.bold),
          ),
          StaticRatingBar(
            rate: model.rating.average / 2,
            size: ScreenUtil().setWidth(28),
            count: 5,
          ),
          Text(
            "${model.ratings_count}人",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28), color: HexColor("#888888")),
          )
        ],
      ),
    );
  }

  Widget getInfo() {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "剧情简介",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: HexColor("#888888")),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20))),
            Text(
              model.summary,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  fontWeight: FontWeight.bold),
            )
          ]),
    );
  }

  Widget getContent() {
    return Container(
      height: ScreenUtil().setWidth(280),
      width: ScreenUtil().setWidth(600),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.title,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.bold)),
            Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(8),
                    bottom: ScreenUtil().setWidth(8))),
            Text(movieType(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: HexColor("#666666"))),
            Text("原名：${model.original_title}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: HexColor("#666666"))),
            Text("上映时间：${model.pubdates.last}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: HexColor("#666666"))),
            Text("片长：${model.durations[0]}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: HexColor("#666666")))
          ]),
    );
  }

  String movieType() {
    String type = '';

    type += model.year + " /";

    for (var i = 0; i < model.countries.length; i++) {
      type += model.countries[i] + " /";
    }
    for (var i = 0; i < model.genres.length; i++) {
      if (i != model.genres.length - 1) {
        type += model.genres[i] + " /";
      } else {
        type += model.genres[i];
      }
    }
    return type;
  }
}
