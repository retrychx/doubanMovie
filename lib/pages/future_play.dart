import 'package:douban/widgets/movie_info.dart';
import 'package:flutter/material.dart';
import 'package:douban/api/http.dart' as api;
import 'package:douban/models/movie_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WillPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FuturePlay();
  }
}

class FuturePlay extends StatefulWidget {
  @override
  FuturePlayState createState() => FuturePlayState();
}

class FuturePlayState extends State<FuturePlay>
    with AutomaticKeepAliveClientMixin {
  static MovieModel model;
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  bool get wantKeepAlive => true;

  init() async {
    Map res = await api.getWillMovies();
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
                  new MovieInfo(false, model.subjects[index]),
              itemCount: model.subjects.length,
            ),
          );
  }
}
