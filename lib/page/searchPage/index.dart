import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../data/hotkey.dart';

class SearchList extends StatefulWidget {
  final List hotkeylist;
  SearchList(this.hotkeylist);
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
  final List hotkeylist = [];
  
  void initState() {
    super.initState();
  }

 

  var a = '1';
  handlesome(value) {
    // print(value);
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
  Widget _contentTop() {
    print('----1-----');
    // print(widget.hotkeylist.length);
      if (_results.length != 0) {

        return new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            // reverse: true,
            itemBuilder: (_, int index) => _results[index],
            itemCount: _results.length,
          ),
        );
      }
      if (_results.length == 0) {
        print('----3-----');
        List<Widget> tList = [];
        Widget content;
        widget.hotkeylist.asMap().forEach((key,f) {
          // print(f);
          tList.add(
            new Container(
              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
              margin: EdgeInsets.fromLTRB(0, 10.0, 5.0, 0),
              decoration: new BoxDecoration(
                color: Colors.grey[600],
                borderRadius: new BorderRadius.circular(10.0)
              ),
              child:new Text(f,
                style: TextStyle(color: Colors.white,)
              )
            )
          );
        });
        content = new Column(
          children: <Widget>[
            new Text('热门搜索', style: TextStyle(
              color: Colors.white
            ),),
            new Wrap(
              spacing: 2, //主轴上子控件的间距
              runSpacing: 5, 
              children: tList,
            )
          ],
        );
        return content;
      }
    
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
                  hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                  fillColor: Colors.grey[600], // 背景色
                  filled: true, // 是否需要背景
                  hasFloatingPlaceholder: true,
                  border: InputBorder.none,
                ),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0
                ),
              ),
            ),
            _contentTop()
          ],
        ) 
    );
  }
}


