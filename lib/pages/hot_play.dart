import 'package:douban/widgets/movie_info.dart';
import 'package:flutter/material.dart';
import 'package:douban/api/http.dart' as api;
import 'package:douban/models/movie_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HotPlay();
  }
}

class HotPlay extends StatefulWidget {
  @override
  HotPlayState createState() => HotPlayState();
}

class HotPlayState extends State<HotPlay> with AutomaticKeepAliveClientMixin {
  static MovieModel model;
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  bool get wantKeepAlive => true;

  init() async {
    Map res = await api.getHotMovies();
    model = MovieModel.fromJson(res);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return model == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            child: new ListView.builder(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20)),
              itemBuilder: (BuildContext context, int index) =>
                  new MovieInfo(true, model.subjects[index]),
              itemCount: model.subjects.length,
            ),
          );
  }
}
