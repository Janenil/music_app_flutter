import 'package:flutter/material.dart';
import './mainPage/main_page.dart';
import './other_page.dart';
// import 'dart:convert';
// import '../util/httpController.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold (
        appBar: AppBar(
          title: new Text(
            'Yinyue App',
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.accessibility),
              color: Colors.yellow,
              // onPressed: () => _loadDataFromNetwork(),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('我的'))),// 路由个人中心页面,
            ),
          ],
        ),
        body: new PageOne(),
        )
    );
  }
}
