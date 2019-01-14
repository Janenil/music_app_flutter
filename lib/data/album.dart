class Obj {
  int code;
  int subcode;
  int accessedFavbase;
  int accessedPlazaCache;
  List<CdList> cdList;
  int cdnum;
  String login;
  int realcdnum;

  Obj({
    this.code,
    this.subcode,
    this.accessedFavbase,
    this.accessedPlazaCache,
    this.cdList,
    this.cdnum,
    this.login,
    this.realcdnum
  });

  factory Obj.fromJson(Map<String, dynamic> parsedJson) {
    var cdLists = parsedJson['cdlist'] as List;
     List<CdList> list = cdLists.map((i) => CdList.fromJson(i)).toList();
    return new Obj(
      code: parsedJson['code'],
      subcode: parsedJson['subcode'],
      accessedFavbase: parsedJson['accessed_favbase'],
      accessedPlazaCache: parsedJson['accessed_plaza_cache'],
      cdList: list,
      cdnum: parsedJson['cdnum'],
      login: parsedJson['login'],
      realcdnum: parsedJson['realcdnum']
    );
  }
}

class CdList {
  String albumPicMid;
  int buynum;
  int cmtnum;
  String coveradurl;
  int ctime;
  int curSongNum;
  String desc;
  String dirPicUrl2;
  int dirShow;
  int dirid;
  int dissid;
  String dissname;
  String disstid;
  int disstype;
  String encryptUin;
  String headurl;
  String ifpicurl;
  int isAd;
  int isdj;
  int isvip;
  String login;
  String logo;
  int mtime;
  String nick;
  String nickname;
  int owndir;
  int picDpi;
  String picMid;
  String scoreavage;
  int scoreusercount;
  int singerid;
  String singermid;
  int songBegin;
  int songUpdateNum;
  int songUpdateTime;
  String songids;
  List<SongList> songlist;
  int songnum;
  String songtypes;
  List<Tags> tags;
  int totalSongNum;
  int type;
  String uin;
  int visitnum;

  CdList({
    this.login,
    this.dissname,
    this.dissid,
    this.uin,
    this.albumPicMid,
    this.buynum,
    this.cmtnum,
    this.coveradurl,
    this.ctime,
    this.curSongNum,
    this.desc,
    this.dirPicUrl2,
    this.dirShow,
    this.dirid,
    this.disstid,
    this.disstype,
    this.encryptUin,
    this.headurl,
    this.ifpicurl,
    this.isAd,
    this.isdj,
    this.isvip,
    this.logo,
    this.mtime,
    this.nick,
    this.nickname,
    this.owndir,
    this.picDpi,
    this.picMid,
    this.scoreavage,
    this.scoreusercount,
    this.singerid,
    this.singermid,
    this.songBegin,
    this.songUpdateNum,
    this.songUpdateTime,
    this.songids,
    this.songlist,
    this.songnum,
    this.songtypes,
    this.tags,
    this.totalSongNum,
    this.type,
    this.visitnum,
  });
  factory CdList.fromJson(Map<String, dynamic> parsedJson) {
    var songlist = parsedJson['songlist'] as List;
    List<SongList> list = songlist.map((i) =>SongList.fromJson(i)).toList();
    var tags = parsedJson['tags'] as List;
    List<Tags> tag = tags.map((i) => Tags.fromJson(i)).toList();
    return new CdList(
      login:parsedJson['login'], 
      dissname:parsedJson['dissname'], 
      dissid:parsedJson['dissid'], 
      uin: parsedJson['uin'], 
      albumPicMid: parsedJson['album_pic_mid'], 
      buynum: parsedJson['buynum'], 
      cmtnum: parsedJson['cmtnum'],
      coveradurl: parsedJson['coveradurl'],
      ctime: parsedJson['ctime'],
      curSongNum: parsedJson['cur_song_num'],
      desc: parsedJson['desc'],
      dirPicUrl2: parsedJson['dir_pic_url2'],
      dirShow: parsedJson['dir_show'],
      dirid: parsedJson['dirid'],
      disstid: parsedJson['disstid'],
      disstype: parsedJson['disstype'],
      encryptUin: parsedJson['encrypt_uin'],
      headurl: parsedJson['headurl'],
      ifpicurl: parsedJson['ifpicurl'],
      isAd: parsedJson['isAd'],
      isdj: parsedJson['isdj'],
      isvip: parsedJson['isvip'],
      logo: parsedJson['logo'],
      mtime: parsedJson['mtime'],
      nick: parsedJson['nick'],
      nickname: parsedJson['nickname'],
      owndir: parsedJson['owndir'],
      picDpi: parsedJson['pic_dpi'],
      picMid: parsedJson['pic_mid'],
      scoreavage: parsedJson['scoreavage'],
      scoreusercount: parsedJson['scoreusercount'],
      singerid: parsedJson['singerid'],
      singermid: parsedJson['singermid'],
      songBegin: parsedJson['song_begin'],
      songUpdateNum: parsedJson['song_update_num'],
      songUpdateTime: parsedJson['song_update_time'],
      songids: parsedJson['songids'],
      songlist: list,
      songnum:parsedJson['songnum'],
      songtypes:parsedJson['songtypes'],
      tags: tag,
      totalSongNum:parsedJson['total_song_num'],
      type:parsedJson['type'],
      visitnum:parsedJson['visitnum']
      );
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