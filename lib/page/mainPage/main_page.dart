import 'package:flutter/material.dart';
import '../recommendPage/recommend.dart';
import '../singerPage/index.dart';
import '../topPage/index.dart';
import '../searchPage/index.dart';

class PageOne extends StatefulWidget {
  _PageOneState createState() => new _PageOneState();
}

class _PageOneState extends State<PageOne> {

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
              new SearchList(),
             ],
            )
          ),
      )
    ;
  }
}