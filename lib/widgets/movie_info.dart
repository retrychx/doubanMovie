import 'package:douban/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:douban/widgets/rating_star.dart';
import 'package:douban/utils/hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:douban/pages/movie_detail.dart';

class MovieInfo extends StatelessWidget {
  final bool isShowStar;
  final Subject subject;
  final Color hotColor = HexColor("#F2A325");
  final Color soonColor = HexColor("#FF3399");
  String directors;
  String casts;
  String count;
  bool isShow;
  MovieInfo(@required this.isShowStar, @required this.subject);

  @override
  Widget build(BuildContext context) {
    isShow = isOnShow();
    initPersons();
    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MovieDetail();
              }));
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(280),
                      height: ScreenUtil().setWidth(320),
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setWidth(30),
                          right: ScreenUtil().setWidth(10)),
                      child: Image.network(
                        this.subject.images.large,
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(520),
                      height: ScreenUtil().setWidth(320),
                      padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(ScreenUtil().setWidth(6)),
                              child: Text(
                                this.subject.title,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(42),
                                    fontWeight: FontWeight.bold),
                              )),
                          this.isShow
                              ? Container(
                                  width: ScreenUtil().setWidth(300),
                                  child: Row(
                                    children: <Widget>[
                                      StaticRatingBar(
                                        rate: this.subject.rating.average / 2,
                                        size: ScreenUtil().setWidth(36),
                                        count: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            ScreenUtil().setWidth(10)),
                                        child: Text(
                                          this
                                              .subject
                                              .rating
                                              .average
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(28),
                                              color: HexColor("#888888")),
                                        ),
                                      )
                                    ],
                                  ))
                              : Padding(
                                  padding:
                                      EdgeInsets.all(ScreenUtil().setWidth(6)),
                                  child: Text("尚未上映",
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(28),
                                          color: HexColor("#888888")))),
                          Container(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setWidth(6),
                                  left: ScreenUtil().setWidth(6),
                                  right: ScreenUtil().setWidth(6)),
                              width: ScreenUtil().setWidth(520),
                              child: Text(
                                "导演：${this.directors}",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: HexColor("#888888")),
                              )),
                          Container(
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(6),
                                right: ScreenUtil().setWidth(6)),
                            width: ScreenUtil().setWidth(520),
                            child: Text(
                              "演员：${this.casts}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              strutStyle:
                                  StrutStyle(height: ScreenUtil().setWidth(4)),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(28),
                                  color: HexColor("#888888")),
                            ),
                          )
                        ],
                      ),
                    ),
                    this.isShow
                        ? Container(
                            width: ScreenUtil().setWidth(220),
                            height: ScreenUtil().setWidth(300),
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(70)),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "${this.count}",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(28),
                                      color: HexColor("#FF3366")),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setWidth(10))),
                                Container(
                                  width: ScreenUtil().setWidth(150),
                                  height: ScreenUtil().setHeight(54),
                                  child: GestureDetector(
                                      onTap: getTicket,
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.all(
                                                Radius.circular(
                                                    ScreenUtil().setWidth(5))),
                                            border: Border.all(
                                                color: HexColor("#FF3366"),
                                                width: 0.5)),
                                        child: Text("购票",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(28),
                                                color: HexColor("#FF3366"))),
                                      )),
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: ScreenUtil().setWidth(220),
                            height: ScreenUtil().setWidth(300),
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(70)),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "${this.count}",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(28),
                                      color: HexColor("#F2A325")),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setWidth(10))),
                                Container(
                                  width: ScreenUtil().setWidth(150),
                                  height: ScreenUtil().setHeight(54),
                                  child: GestureDetector(
                                      onTap: getTicket,
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.all(
                                                Radius.circular(
                                                    ScreenUtil().setWidth(5))),
                                            border: Border.all(
                                                color: HexColor("#F2A325"),
                                                width: 0.5)),
                                        child: Text("预售",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(28),
                                                color: HexColor("#F2A325"))),
                                      )),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
                  height: ScreenUtil.instance.setHeight(1),
                  color: Color.fromARGB(100, 167, 161, 164),
                ),
              ],
            )));
  }

  bool isOnShow() {
    var showTime = DateTime.parse(this.subject.mainland_pubdate);
    var now = DateTime.now().year.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().day.toString();
    var nowTime = DateTime.parse(now);
    return nowTime.isAfter(showTime);
  }

  void getTicket() {}

  void initPersons() {
    this.directors = "";
    this.casts = "";
    this.count = "";
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
  }
}
