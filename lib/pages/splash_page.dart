import 'package:flutter/material.dart';
import 'dart:async';
import 'package:douban/pages/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  Timer timer;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    timer = Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
    return Container(
      color: Colors.white,
      child: Image.asset("images/ic_splash.png"),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
