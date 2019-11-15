import 'package:flutter/material.dart';
import 'package:douban/pages/about_me.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return AboutMe();
        }));
      },
      child: SizedBox.expand(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(ScreenUtil.instance.setHeight(10)),
          child: Container(
            color: Color.fromARGB(255, 248, 248, 248),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: ScreenUtil.instance.setWidth(28),
                  height: ScreenUtil.instance.setWidth(28),
                  child: Image.asset(
                    "images/ic_search.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
                  child: Text("电影/电视剧/影人",
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 161, 164),
                          fontSize: ScreenUtil.instance.setSp(26))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
