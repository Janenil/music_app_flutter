import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';


class SearchList extends StatefulWidget {
  _SearchListState createState() => new _SearchListState();
}

class SearchResult extends StatelessWidget {
  SearchResult({this.songName, this.singer});
  final String songName;
  final String singer;
  Widget build(BuildContext context) {
    return new Container (
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new IconTheme(
              data: new IconThemeData(color: Colors.grey), // icon主题 
              child: new Icon(Icons.music_note, size: 35.0,),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(songName,
                  style: new TextStyle(
                    color: Colors.grey,
                  ),
                ),
                new Text(singer,
                  style: new TextStyle(
                    color: Colors.grey
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SearchListState extends State<SearchList> {
  final _searchControll = new TextEditingController();
  final List<SearchResult> _results = <SearchResult>[];
  void initState() {
    super.initState();
    _loadDataFromNetwork();
  }
  _formatUrl () {
    return 'https://c.y.qq.com/splcloud/fcgi-bin/gethotkey.fcg?g_tk=531708863&uin=1297716249&format=json&inCharset=utf-8&outCharset=utf-8&notice=0&platform=h5&needNewCode=1&_=1545026658181';
  }

  _loadDataFromNetwork() async {
    http.Response response = await http.get(_formatUrl());
    print(response.body);
    return response.body;
  }

  var a = '1';
  handlesome(value) {
    print(value);
    setState(() {
      a = value;
    });
    SearchResult re = new SearchResult(
      singer: value,
      songName: value,
    );
    setState(() {
      _results.insert(0, re);
    });
  }

  Widget build(BuildContext context) {
      return new Container(
        decoration: new BoxDecoration(
          color: Colors.black,
        ),
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Container(
              child: new TextField(
                controller: _searchControll,
                // onTap: () => print(value),
                onChanged: (value) => print(value),
                onSubmitted: (value) => handlesome(value),
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.search), // 前置icon
                  hintText: '请输入搜索内容', //placeholder
                  fillColor: Colors.grey[300], // 背景色
                  filled: true, // 是否需要背景
                  hasFloatingPlaceholder: true,
                  border: InputBorder.none
                ),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0
                ),
              ),
            ),
           new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                // reverse: true,
                itemBuilder: (_, int index) => _results[index],
                itemCount: _results.length,
              ),
            ),
          ],
        ) 
    );
  }
}


