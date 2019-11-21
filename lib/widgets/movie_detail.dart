import 'package:douban/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:douban/widgets/rating_star.dart';
import 'package:douban/utils/hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetail extends StatelessWidget {
  final bool isShowStar;
  final Subject subject;
  final Color hotColor = HexColor("#F2A325");
  final Color soonColor = HexColor("#E8E9EA");
  String directors = "";
  String casts = "";
  String count = "";
  MovieDetail(@required this.isShowStar, @required this.subject);

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < this.subject.directors.length; i++) {
      if (i != this.subject.directors.length - 1) {
        this.directors =
            this.directors + this.subject.directors[i].name + " / ";
      } else if (i == this.subject.directors.length - 1) {
        this.directors = this.directors + this.subject.directors[i].name;
      }
    }
    for (var i = 0; i < this.subject.casts.length; i++) {
      if (i != this.subject.casts.length - 1) {
        this.casts = this.casts + this.subject.casts[i].name + " / ";
      } else if (i == this.subject.casts.length - 1) {
        this.casts = this.casts + this.subject.casts[i].name;
      }
    }
    if (this.subject.collect_count > 9999) {
      this.count =
          (this.subject.collect_count / 10000).toStringAsFixed(1) + "万人看过";
    } else {
      this.count = this.subject.collect_count.toString() + "人看过";
    }
    return Container(
        child: GestureDetector(
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(250),
            height: ScreenUtil().setWidth(300),
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(10)),
            child: Image.network(
              this.subject.images.large,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(400),
            height: ScreenUtil().setWidth(300),
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.subject.title,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    width: ScreenUtil().setWidth(300),
                    child: Row(
                      children: <Widget>[
                        StaticRatingBar(
                          rate: this.subject.rating.average / 2,
                          size: ScreenUtil().setWidth(25),
                          count: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                          child: Text(
                            this.subject.rating.average.toString(),
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(22),
                                color: HexColor("#888888")),
                          ),
                        )
                      ],
                    )),
                Container(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(6)),
                    width: ScreenUtil().setWidth(600),
                    child: Text(
                      "导演：${this.directors}",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: HexColor("#888888")),
                    )),
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(6)),
                  width: ScreenUtil().setWidth(600),
                  child: Text(
                    "演员：${this.casts}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        color: HexColor("#888888")),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setWidth(300),
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
            child: Column(
              children: <Widget>[
                Text(
                  "${this.count}",
                  style: TextStyle(fontSize: ScreenUtil().setSp(22)),
                ),
                Padding(padding: EdgeInsets.all(ScreenUtil().setWidth(10))),
                Container(
                  width: ScreenUtil().setWidth(170),
                  height: ScreenUtil().setHeight(70),
                  child: GestureDetector(
                      onTap: getTicket,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        child: Text("购票",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(22),
                            )),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  void getTicket() {}
}
