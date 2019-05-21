class Top {
  TopInfo topinfo;
  List<TopSongList> songlist;
  Top({
    this.songlist,
    this.topinfo
  });

  factory Top.fromJson(Map<String, dynamic> parsedJson) {
    var _songlist = parsedJson['songlist'] as List;
    List<TopSongList> songlist = _songlist.map((i) => TopSongList.fromJson(i)).toList();
    return new Top(
      songlist: songlist,
      topinfo: TopInfo.fromJson(parsedJson['topinfo'])
    );
  }
}

class TopInfo {
  String listName;
  String picAlbum;
  TopInfo({
    this.listName,
    this.picAlbum
  });
  factory TopInfo.fromJson(Map<String, dynamic> parsedJson) {
    return TopInfo (listName: parsedJson['listName'],picAlbum: parsedJson['pic_album']);
  }
}

class TopSongList {
  SongList data;
  TopSongList ({
    this.data
  });
  factory TopSongList.fromJson(Map<String, dynamic> parsedJson) {
    return TopSongList(data: SongList.fromJson(parsedJson['data']));
  }

}



class SongList {
  String albumdesc;
  int albumid;
  String albummid;
  String albumname;
  int alertid;
  int belongCD;
  int cdIdx;
  int interval;
  int isonly;
  String label;
  int msgid;
  Pay pay;
  Preview preview;
  int rate;
  List<Singer> singer;
  int size5_1;
  int size128;
  int size320;
  int sizeape;
  int sizeflac;
  int sizeogg;
  int songid;
  String songmid;
  String songname;
  String songorig;
  int songtype;
  String strMediaMid;
  int stream;
  int switchCode;
  int type;
  String vid;

  SongList({
    this.type,
    this.albumdesc,
    this.albumid,
    this.albummid,
    this.albumname,
    this.alertid,
    this.belongCD,
    this.cdIdx,
    this.interval,
    this.isonly,
    this.label,
    this.msgid,
    this.pay,
    this.preview,
    this.rate,
    this.singer,
    this.size128,
    this.size320,
    this.size5_1,
    this.sizeape,
    this.sizeflac,
    this.sizeogg,
    this.songid,
    this.songmid,
    this.songname,
    this.songorig,
    this.songtype,
    this.strMediaMid,
    this.stream,
    this.switchCode,
    this.vid
  });
  factory SongList.fromJson(Map<String, dynamic> parsedJson){

    var singers = parsedJson['singer'] as List;
    List<Singer> singer = singers.map((i) => Singer.fromJson(i)).toList();
    return new SongList(
      type: parsedJson['type'],
      albumdesc: parsedJson['albumdesc'],
      albumid: parsedJson['albumid'],
      albummid: parsedJson['albummid'],
      albumname: parsedJson['albumname'],
      alertid: parsedJson['alertid'],
      belongCD: parsedJson['belongCD'],
      cdIdx: parsedJson['cdIdx'],
      interval: parsedJson['interval'],
      isonly: parsedJson['isonly'],
      label: parsedJson['label'],
      msgid: parsedJson['msgid'],
      pay: Pay.fromJson(parsedJson['pay']),
      preview: Preview.fromJson(parsedJson['preview']),
      rate: parsedJson['rate'],
      singer: singer,
      size128: parsedJson['size128'],
      size320: parsedJson['size320'],
      size5_1: parsedJson['size5_1'],
      sizeape: parsedJson['sizeape'],
      sizeflac: parsedJson['sizeflac'],
      sizeogg: parsedJson['sizeogg'],
      songid: parsedJson['songid'],
      songmid: parsedJson['songmid'],
      songname: parsedJson['songname'],
      songorig: parsedJson['songorig'],
      songtype: parsedJson['songtype'],
      strMediaMid: parsedJson['strMediaMid'],
      stream: parsedJson['stream'],
      switchCode: parsedJson['switchCode'],
      vid: parsedJson['vid']
    );
  }
}

class Tags{
  int id;
  String name;
  int pid;
  Tags({
    this.id,
    this.name,
    this.pid
  });
  factory Tags.fromJson(Map<String, dynamic> parsedJson) {
    return new Tags(
      id: parsedJson['id'],
      name: parsedJson['name'],
      pid: parsedJson['pid']
    );
  }
}


class Pay{
  int payalbum;
  int payalbumprice;
  int paydownload;
  int payinfo;
  int payplay;
  int paytrackmouth;
  int paytrackprice;
  int timefree;
  Pay({
    this.payalbum,
    this.payalbumprice,
    this.paydownload,
    this.payinfo,
    this.payplay,
    this.paytrackmouth,
    this.paytrackprice,
    this.timefree
  });

  factory Pay.fromJson(Map<String, dynamic> parsedJson) {
    return new Pay(
      payalbum: parsedJson['payalbum'],
      payalbumprice: parsedJson['payalbumprice'],
      paydownload: parsedJson['paydownload'],
      payinfo: parsedJson['payinfo'],
      payplay: parsedJson['payplay'],
      paytrackmouth: parsedJson['paytrackmouth'],
      paytrackprice: parsedJson['paytrackprice'],
      timefree: parsedJson['timefree']
    );
  }
}

class Preview{
  int trybegin;
  int tryend;
  int trysize;
  Preview({
    this.trybegin,
    this.tryend,
    this.trysize
  });
  factory Preview.fromJson(Map<String, dynamic> parsedJson){
    return new Preview(
      trybegin: parsedJson['trybegin'],
      tryend: parsedJson['tryend'],
      trysize: parsedJson['trysize'],
    );
  }
}

class Singer{
  int id;
  String mid;
  String name;
  Singer({
    this.id,
    this.mid,
    this.name
  });
  factory Singer.fromJson(Map<String, dynamic> parsedJson){
    return new Singer(
      id: parsedJson['id'],
      mid: parsedJson['mid'],
      name: parsedJson['name']
    );
  }
}