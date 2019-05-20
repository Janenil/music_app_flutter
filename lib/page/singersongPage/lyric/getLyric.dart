// import 'package:flutter/services.dart';
import './lyric.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../data/lyric.dart';
class Utils {
  static Future<Lyric> getLyricFromTxt(url) async {
    List<LyricSlice> slices = new List();
    http.Response response = await http.get(url);
    var _json = response.body;
    // 截取
    final jsonRes = json.decode(_json);

    LyricData lyricdata = new LyricData.fromJson(jsonRes);
    // print(lyricdata);
    List<String> list = lyricdata.data.lyric.split("[换行]");
    

    print("lines:" + list.length.toString() + "");
    for (String line in list) {
      // print(line);
      if (line.startsWith("[0")) {
        slices.add(getLyricSlice(line));
      }
    }
    Lyric lyric = new Lyric(slices);
    return lyric;
    // });
  }

  static LyricSlice getLyricSlice(String line) {
    LyricSlice lyricSlice = new LyricSlice();
    // print(line.substring(10));
    if (line.substring(10) != null) {
      lyricSlice.slice = line.substring(10);
    } else {
      lyricSlice.slice = '...';
    }
    lyricSlice.inSecond =
        int.parse(line.substring(1, 3)) * 60 + int.parse(line.substring(4, 6));
    print(lyricSlice.inSecond.toString() + "-----" + lyricSlice.slice);
    return lyricSlice;
  }
}
