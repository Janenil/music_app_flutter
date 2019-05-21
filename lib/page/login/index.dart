import 'package:flutter/material.dart';
import '../../util/eventBus.dart';
import '../../data/album.dart';

class Login extends StatefulWidget {
  Function change;
  Login(this.change);
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final _searchControll = new TextEditingController();
  final _searchControll1 = new TextEditingController();
  String username;
  String pwd;
  

  handlePress() {
    if (username != null && pwd != null) {
        // 掉接口
      eventBus.fire(new MyEvent('555',[]));
      widget.change();
      Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("登陆成功"),
        ));
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("请填写用户名和密码"),
      ));
    }
  }
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color:  Colors.black
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(10.0),
            child: new TextField(
              controller: _searchControll,
              // onTap: () => print(value),
              onChanged: (value) => username = value,
              decoration:  InputDecoration(
                // prefixIcon: Icon(Icons.search), // 前置icon
                hintText: '请输入用户名', //placeholder
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                fillColor: Colors.grey[600], // 背景色
                filled: true, // 是否需要背景
                hasFloatingPlaceholder: true,
                border: InputBorder.none,
              ),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16.0
              ),
            )
          ),
          new Container(
            margin: const EdgeInsets.all(10.0),
            child: new TextField(
              controller: _searchControll1,
              // onTap: () => print(value),flutter 
              onChanged: (value) => pwd = value,
              decoration:  InputDecoration(
                // prefixIcon: Icon(Icons.search), // 前置icon
                hintText: '请输入密码', //placeholder
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                fillColor: Colors.grey[600], // 背景色
                filled: true, // 是否需要背景
                hasFloatingPlaceholder: true,
                border: InputBorder.none,
              ),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16.0
              ),
            )
          ),
          new Container(
            child: Builder(
              builder: (context) => Center(
              child: RaisedButton(
                child: const Text('登陆'),
                color: Colors.yellow,
                textColor: Colors.black,
                onPressed: () => handlePress(),
              ),
            ),
            ),
          )
        ],
      )
    );
  }
}