import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/singerlist.dart';
import '../singersOnePage/index.dart';
class SingerList extends StatefulWidget {
  final List<SingerObj> singerAllList;
  SingerList(this.singerAllList);
  _SingerListState createState() => new _SingerListState();
}

class _SingerListState extends State<SingerList> {
  List<SingerObj> singerList;
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
      SingerAllList singer = new SingerAllList.fromJson(jsonRes);
      if (this.mounted) {
        setState(() {
          singerList = singer.data.list;
        });
        print(singerList[0].fsingername);
      }
    });
  }

  Widget content() {
    List<Widget> items = [];
    widget.singerAllList.asMap().forEach((key,f){
      items.add(
        new GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context,) => new AlbumPage(f)));
            },
              child: new Container(
                child:new Row(
                  children: <Widget>[
                    new Container(
                      width: 50.0,
                      height: 50.0,
                      margin: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                'https://y.gtimg.cn/music/photo_new/T001R300x300M000'+ f.fsingermid+'.jpg?max_age=2592000',
                          )
                        )
                      ),
                    ),
                    new Text(
                      f.fsingername,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              )
            )
        );
    });
    
    return new Container(
      child: new Column(
          children: [
            new Expanded(
              // flex: 1,
              // 可滚动
              child: new SingleChildScrollView(
                child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.black
                    ),
                    child:new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: items,
                    ),
                ),
              ),
            ),],
      ),
    );
  }
  void initState(){
    super.initState();
    // _loadSinger();
    print(widget.singerAllList);
  }
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.black
        ),
        child: content(),
      )
    );
  }
}