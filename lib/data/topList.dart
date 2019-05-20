class TopListObj {
  int code;
  Data data;
  int defaultcode;
  String message;
  int subcode;

  TopListObj({
    this.code,
    this.data,
    this.subcode,
    this.defaultcode,
    this.message
  });
  
  factory TopListObj.fromJson(Map<String, dynamic> parsedJson) {
    return TopListObj (
      code: parsedJson['code'],
      data: Data.fromJson(parsedJson['data']),
      subcode: parsedJson['subcode'],
      defaultcode: parsedJson['default'],
      message: parsedJson['message']
    );
  }
}

class Data {
  List<ListObj> topList;
  Data({
    this.topList
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {

    var _topList = parsedJson['topList'] as List;
    List<ListObj> topList = _topList.map((i) => ListObj.fromJson(i)).toList();
    return Data (
      topList: topList
    );
  }
}

class ListObj {
  int id;
  int listenCount;
  String picUrl;
  String topTitle;
  List<SongObj> songList;
  int type;
  
  ListObj({
    this.type,
    this.id,
    this.listenCount,
    this.picUrl,
    this.songList,
    this.topTitle,
  });

  factory ListObj.fromJson(Map<String, dynamic> parsedJson) {

    var _songList = parsedJson['songList'] as List;
    List<SongObj> songList = _songList.map((i) => SongObj.fromJson(i)).toList();

    return ListObj(
      type: parsedJson['type'],
      id: parsedJson['id'],
      listenCount: parsedJson['listenCount'],
      picUrl: parsedJson['picUrl'],
      topTitle: parsedJson['topTitle'],
      songList: songList
    );
  }
}

class SongObj {
  String singername;
  String songname;

  SongObj({
    this.songname,
    this.singername
  });
  factory SongObj.fromJson(Map<String,dynamic> parsedJson) {
    return SongObj(
      singername: parsedJson['singername'],
      songname: parsedJson['songname']
    );
  }
}