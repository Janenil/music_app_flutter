import 'package:flutter/material.dart';



class Register extends StatefulWidget {
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  final _searchControll = new TextEditingController();
  final _searchControll1 = new TextEditingController();
  final _searchControll2 = new TextEditingController();
  String username;
  String pwd;
  String pwd1;
  handlePress() {
    print(username);
    print(pwd);
    print(pwd1);
    if (username != null && pwd != null && pwd1 != null) {
      if(pwd == pwd1) {
        // 掉接口
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("注册成功"),
        ));
      } else {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("两次密码输入不一致"),
        ));
      }
    } else {
      //
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("请填写完整"),
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
            margin: const EdgeInsets.all(10.0),
            child: new TextField(
              controller: _searchControll2,
              // onTap: () => print(value),
              onChanged: (value) => pwd1 = value,
              decoration:  InputDecoration(
                // prefixIcon: Icon(Icons.search), // 前置icon
                hintText: '请再次输入密码', //placeholder
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
                child: const Text('注册'),
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