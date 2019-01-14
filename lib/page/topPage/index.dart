import 'package:flutter/material.dart';

class TopList extends StatefulWidget {
  _TopListState createState() => new _TopListState();
}

class _TopListState extends State<TopList> {

  Widget build(BuildContext context) {
    return new Material(
      child: new Text('排行榜列表'),
    );
  }
}