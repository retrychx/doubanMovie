import 'package:flutter/material.dart';
import 'package:douban/api/http.dart' as api;
import 'package:douban/models/movie_model.dart';

class HotPlay extends StatefulWidget {
  @override
  HotPlayState createState() => HotPlayState();
}

class HotPlayState extends State<HotPlay> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Map res = await api.getHotMovies();
    var model = MovieModel.fromJson(res);
    print(model.subjects);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('123'),
    );
  }
}
