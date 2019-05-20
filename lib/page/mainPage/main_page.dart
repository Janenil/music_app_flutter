import 'package:flutter/material.dart';
import '../recommendPage/recommend.dart';
import '../singerPage/index.dart';
import '../topPage/index.dart';
import '../searchPage/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/hotkey.dart';
import '../../data/topList.dart';
import '../../data/singerlist.dart';

class PageOne extends StatefulWidget {
  _PageOneState createState() => new _PageOneState();
}

class _PageOneState extends State<PageOne> {
  void initState() {
    super.initState();
    _loadDataFromNetwork();
    getTopList();
    getSinegr();
  }
  List<SingerObj> singerallList = [];
  List<ListObj> topAllList = [];
  
  String singerurl = 'https://c.y.qq.com/v8/fcg-bin/v8.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=jsonp&channel=singer&page=list&key=all_all_all&pagesize=100&pagenum=1&hostUin=0&needNewCode=0&platform=yqq&jsonpCallback=jp0';

  String url = 'https://c.y.qq.com/v8/fcg-bin/fcg_myqq_toplist.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=jsonp&uin=0&needNewCode=1&platform=h5&jsonpCallback=jp0';
  
  getSinegr() async{
    http.Response response = await http.get(singerurl);
    
    var _json = response.body;
    // 截取
    var str = _json.substring(5, _json.length - 1);
    final jsonRes = json.decode(str);

    SingerAllList _singerlist = new SingerAllList.fromJson(jsonRes);
    // topAllList = _toplist.data.topList;
   
    _singerlist.data.list.asMap().forEach((key,i){
        singerallList.add(i);
    });
    // print('-----singerlist-----');
    // print(singerallList.length);
    return response.body;
  }

  getTopList() async{
    http.Response response = await http.get(url);
    var _json = response.body;
    // 截取
    var str = _json.substring(4, _json.length - 1);
    final jsonRes = json.decode(str);

    TopListObj _toplist = new TopListObj.fromJson(jsonRes);
    // topAllList = _toplist.data.topList;
   
    _toplist.data.topList.asMap().forEach((key,i){
        if (key < 10) {
          // print(i.k);
          topAllList.add(i);
        }
    });
    // print('-----1-----');
    // print(topAllList.length);
    return response.body;
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
              new Center(child: new SingerList(singerallList)),
              new Center(child: new TopList(topAllList)),
              new SearchList(hotkeylist),
             ],
            )
          ),
      )
    ;
  }
}