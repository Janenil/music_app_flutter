import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './singer.dart';
class SingerList extends StatefulWidget {
  _SingerListState createState() => new _SingerListState();
}

class _SingerListState extends State<SingerList> {
  List<SingerInfo> singerList;
  var map = {
    "g_tk": "1928093487",
    "inCharset": "utf-8",
    "outCharset": "utf-8",
    "notice": "0",
    "format": "jsonp",
    "channel": "singer",
    "page": "list",
    "key": "all_all_all",
    "pagesize": 100,
    "pagenum": 1,
    "platform": "yqq",
    "hostUin": "0",
    "needNewCode": "0",
    "jsonpCallback": "jp1"
  };

  concatString(url) {
    if (map != null && map.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      map.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    return url;
  }

  _loadSinger() {
    var url = 'https://c.y.qq.com/v8/fcg-bin/v8.fcg';
    http.get(concatString(url)).then((item) {
      print(item.body);
      var _json = item.body;
      var str = _json.substring(5, _json.length - 2);
      // print(str.substring(str.length-5, str.length));
      final jsonRes = json.decode(str);
      Singer singer = new Singer.fromJson(jsonRes);
      setState(() {
        singerList = singer.data.list;
      });
      print(singerList[0].fsingername);
    });
  }


  void initState(){
    super.initState();
    _loadSinger();
  }
  Widget build(BuildContext context) {
    return new Material(
      child: new Text('歌手列表'),
    );
  }
}