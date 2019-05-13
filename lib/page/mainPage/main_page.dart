import 'package:flutter/material.dart';
import '../recommendPage/recommend.dart';
import '../singerPage/index.dart';
import '../topPage/index.dart';
import '../searchPage/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/hotkey.dart';
class PageOne extends StatefulWidget {
  _PageOneState createState() => new _PageOneState();
}

class _PageOneState extends State<PageOne> {
  void initState() {
    super.initState();
    _loadDataFromNetwork();
  }

  List hotkeylist = [];
  _formatUrl () {
    return 'https://c.y.qq.com/splcloud/fcgi-bin/gethotkey.fcg?g_tk=531708863&uin=1297716249&format=json&inCharset=utf-8&outCharset=utf-8&notice=0&platform=h5&needNewCode=1&_=1545026658181';
  }

  _loadDataFromNetwork() async {
    http.Response response = await http.get(_formatUrl());
    var resJson = json.decode(response.body);
    Hotkey hoykey = new Hotkey.fromJson(resJson);
    hoykey.data.hotkeylist.asMap().forEach((key,i){
        if (key < 10) {
          // print(i.k);
          hotkeylist.add(i.k);
        }
    });
    return response.body;
  }

  Widget build(BuildContext context) {
    return  new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.black,
            title: new TabBar(
              tabs: [
                new Tab(child: new Text('推荐')),
                new Tab(child: new Text('歌手')),
                new Tab(child: new Text('排行榜')),
                new Tab(child: new Text('搜索')),
              ],
              indicatorColor: Colors.black26,
            ),
          ),
          body: new TabBarView(
            children: [
              new Center(child: new Recommend()),
              new Center(child: new SingerList()),
              new Center(child: new TopList()),
              new SearchList(hotkeylist),
             ],
            )
          ),
      )
    ;
  }
}