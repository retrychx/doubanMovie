import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:douban/api/api.dart';

getHotMovies() async {
  var res = await http.get(Api.InTheaters);
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body);
  } else {
    print("request failt ${res.statusCode}");
  }
}

getWillMovies() async {
  var res = await http.get(Api.WillOnSale);
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body);
  } else {
    print("request failt ${res.statusCode}");
  }
}
