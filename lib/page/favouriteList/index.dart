// import 'package:flutter/material.dart';
// import '../../data/album.dart';
// import '../../util/eventBus.dart';

// class Favour extends StatefulWidget {
//   //构造函数，获取参数
//   _FavourState createState() => new _FavourState();
// }

// class _FavourState extends State<Favour> {
//   List<SongList> list;
//   void initState() {
//     super.initState();
//     eventBus.on<MyEvent>().listen((MyEvent data) =>
//       show(data.list)
//     );
//   }
//   void show(List<SongList> val) {
//     if (this.mounted) {
//       setState(() {
//         list = val;
//       });
//       print('----123-----');
//       print(list.length);
//     }
//   }
//     @override
//   void initState() {
//     super.initState();
//     controller = new TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   TabBar getTabBar() {
//     return new TabBar(
//       tabs: <Widget>[
//         new Tab(
//           icon: new Icon(Icons.favorite),
//         ),
//         new Tab(
//           icon: new Icon(Icons.adb),
//         ),
//         new Tab(
//           icon: new Icon(Icons.airport_shuttle),
//         ),
//       ],
//       controller: controller,
//     );
//   }

//   TabBarView getTabBarView(var tabs) {
//     return new TabBarView(
//       children: tabs,
//       controller: controller,
//     );
//   }
//   Widget build(BuildContext context) {
//     return  new DefaultTabController(
//       length: 4,
//       child:new Scaffold(
//       // body: list == null ?
//       // new Center(child: new Text('空列表'),):  new Text(list[0].songname, style: TextStyle(color: Colors.yellow),),
//       appBar: new AppBar(
//             backgroundColor: Colors.black,
//             // title: new TabBar(
//             //   tabs: [
//             //     new Tab(child: new Text('喜欢的歌曲')),
//             //     new Tab(child: new Text('收藏的歌单')),
//             //   ],
//             //   indicatorColor: Colors.black26,
//             // ),
            
//           ),
//           body: new TabBarView(
//             children: [
//               new Center(child: new Text('暂无收藏的歌曲')),
//               new Center(child: new Text('暂无收藏的歌曲')),
//              ],
//           )
//       )
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(new Favour());

class Favour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<Favour> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            color: Colors.black,
            height: 50.0,
            child: new TabBar(
              tabs: [new Text("喜欢的歌曲",style: TextStyle(fontSize: 15.0),), new Text("收藏的歌单",style: TextStyle(fontSize: 15.0))],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            new Center(child:new Text("暂无收藏的歌曲")), new Center(child:new Text("暂无收藏的歌曲"))
          ],
        ),
      ),
    ); 

  }
}