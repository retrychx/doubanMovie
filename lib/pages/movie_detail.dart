import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:douban/api/http.dart' as api;
import 'package:douban/models/movie_detail_model.dart';
import 'package:color_thief_flutter/color_thief_flutter.dart';

class MovieDetail extends StatefulWidget {
  final String id;
  MovieDetail({@required this.id});
  @override
  MovieDetailState createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetail> {
  static MovieDetaiModel model;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Map res = await api.getMovieDetail(this.widget.id);
    model = MovieDetaiModel.fromJson(res);
    if (mounted) {
      var color = await getPaletteFromImage(Image.network(model.images.large))
          .then((color) {});
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print(model);
    return model == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(ScreenUtil().setHeight(150)),
              child: AppBar(
                title: getTitle(),
                centerTitle: true,
              ),
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setWidth(300),
                  )
                ],
              ),
            ),
          );
  }

  Widget getTitle() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(200),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.fastfood,
            size: ScreenUtil().setWidth(80),
          ),
          Text(
            "电影",
            style: TextStyle(fontSize: ScreenUtil().setSp(50)),
          )
        ],
      ),
    );
  }
}
