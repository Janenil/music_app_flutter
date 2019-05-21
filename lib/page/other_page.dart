import 'package:flutter/material.dart';
import './register/index.dart';
import './favouriteList/index.dart';
import './login/index.dart';

import '../util/eventBus.dart';
import '../data/album.dart';
class OtherPage extends StatefulWidget {

  final String id;    //定义一个常量，用于保存跳转进来获取到的参数
  OtherPage(this.id);    //构造函数，获取参数
  _OtherPageState createState() => new _OtherPageState();
}
  // final items = new List<ListItem>.generate(
  //     1000,
  //     (i) => i % 6 == 0
  //         ? new HeadingItem("Heading $i")
  //         : new MessageItem("Sender $i", "Message body $i"),
  //   );


class _OtherPageState extends State<OtherPage> {
  List<SongList> list;

  void initState() {
    super.initState();
    eventBus.on<MyEvent>().listen((MyEvent data) =>
      show(data.list)
    );
  }
  void show(List<SongList> val) {
    if (this.mounted) {
      setState(() {
        list = val;
      });
      print('----123-----');
      print(list.length);
    }
  }
  String _id = '999999';
  handleChange() {
    setState(() {
      _id = '123';
    });
  }
  Widget content() {
    if (widget.id != '999999' || _id != '999999' ) {
      return new Favour();
    } else {
      return new Container(
        decoration: new BoxDecoration(
          color: Colors.black
        ),
        child: new Column(
            children: <Widget>[
              new Text(isLogin ? '登陆' : '注册', 
                style: new TextStyle(
                  color: Colors.yellow, 
                  fontSize: 18.0),
                ),
              isLogin == true ? new Login(handleChange) : new Register(),
              new GestureDetector(
                onTap: () => setState((){
                   isLogin ?  isLogin = false : isLogin = true;
                }) ,
                child: new Text(isLogin ? '还未注册' : '去登陆', 
                style: new TextStyle(color: Colors.yellow, fontSize: 14.0),),
              )
            ],
          ),
      ); 
    }
    
  }
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("用户中心",
            style: TextStyle(color: Colors.yellow),
            ),
        backgroundColor: Colors.black,
      ),    //将参数当作页面标题
      body:  content()
      
    );
  }
}

abstract class ListItem {}

// A ListItem that contains data to display a heading
// class HeadingItem implements ListItem {
//   final String heading;

//   HeadingItem(this.heading);
// }

// // A ListItem that contains data to display a message
// class MessageItem implements ListItem {
//   final String sender;
//   final String body;

//   MessageItem(this.sender, this.body);
// }
