class SingerWrapper {
  int code;
  Data data;

  SingerWrapper({
    this.code,
    this.data
  });

  factory SingerWrapper.fromJson(Map<String, dynamic> parsedJson) {
    return SingerWrapper (data: Data.fromJson(parsedJson['data']),
    code: parsedJson['code']);
  }  
}

class Data {
  List<SongInstance> list;

  Data({
    this.list
  });
  factory Data.fromJson(Map<String, dynamic> parsedJson) {

    var _list = parsedJson['list'] as List;
    List<SongInstance> list = _list.map((i) => SongInstance.fromJson(i)).toList();
    return Data(list: list);
  }
}

class SongInstance {
  MusicData musicData;
  SongInstance({
    this.musicData
  });
  factory SongInstance.fromJson(Map<String, dynamic> parsedJson) {
    return SongInstance(musicData: MusicData.fromJson(parsedJson['musicData']));
  }

}


class MusicData {
  String albumname;
  String songmid;
  String songname;
  String albummid;
  int songid;
  MusicData({
    this.songname,
    this.albumname,
    this.songmid,
    this.albummid,
    this.songid
  });

  factory MusicData.fromJson(Map<String, dynamic> parsedJson) {
    return MusicData (
      albumname: parsedJson['albumname'],
      songmid: parsedJson['songmid'],
      songname: parsedJson['songname'],
      albummid: parsedJson['albummid'],
      songid: parsedJson['songid']
    );
  }
}