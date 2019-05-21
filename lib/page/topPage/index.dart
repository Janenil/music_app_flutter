import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/topList.dart';
import '../topAlbumPage/index.dart';
class TopList extends StatefulWidget {
  final List<ListObj> topAllList;
  TopList(
    this.topAllList
  );
  _TopListState createState() => new _TopListState();
}

class _TopListState extends State<TopList> {
  final List<ListObj> topAllList = [];

  List<Widget> content() {
    List<Widget> tList = new List();
    print('----1----2----');
    if (widget.topAllList.length > 0) {
      print('---1----2-----3----');
      // List<ListObj> list = widget.topAllList;
        widget.topAllList.asMap().forEach((key,f) {
      // print(f.picUrl);
      tList.add(
       new GestureDetector(
         onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context,) => new AlbumPage(f))),
         child:  new Container(
          decoration: new BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[850],
                blurRadius: 5.0, // has the effect of softening the shadow
                offset: Offset(
                  0.0, // horizontal, move right 2
                  3.0, // vertical, move down 2
                ),
              )
            ],
          ),
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            children: <Widget>[
              Image.network(
                f.picUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.fill
              ),
              new Container(
                height: 100.0,
                width: 250.0,
                padding: const EdgeInsets.fromLTRB(10.0, 5.0,0.0,10.0),
                
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text(
                      f.songList[0].songname + ' - ' + f.songList[0].singername, 
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    new Text(
                      f.songList[1].songname + ' - ' +f.songList[1].singername, 
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    new Text(
                      f.songList[2].songname + ' - ' +f.songList[2].singername, 
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
              ],),
              )
              
            ],
          ),
        )
      ,
       )
      );
    });
    }
    
    return tList;
    // return new Text('123');
  }
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.black
        ),
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
                      children: content()
                    ),
                  ),
              ),
            ),
          ]
        ),
      )
      // child: content()
    );
  }
}