import 'package:douban/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:douban/api/http.dart' as api;
import 'package:douban/models/movie_detail_model.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:douban/widgets/movie_header.dart';

class MovieDetail extends StatefulWidget {
  final String id;
  MovieDetail({@required this.id});
  @override
  MovieDetailState createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetail>
    with AutomaticKeepAliveClientMixin {
  static MovieDetaiModel model;
  PaletteGenerator palette;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Map res = await api.getMovieDetail(this.widget.id);
    model = MovieDetaiModel.fromJson(res);
    palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(model.images.large));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(150)),
        child: AppBar(
          backgroundColor:
              palette == null ? Colors.white : palette.dominantColor.color,
          elevation: 0,
          title: getTitle(),
          centerTitle: true,
        ),
      ),
      body: (model == null || palette == null)
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: HexColor("#eeeeee"),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setWidth(700),
                    color: palette.dominantColor.color,
                    child: Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(20),
                            bottom: ScreenUtil().setWidth(50)),
                        child: Image.network(model.images.large)),
                  ),
                  MovieHeader(model: model),
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
