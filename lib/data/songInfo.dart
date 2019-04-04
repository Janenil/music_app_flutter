class SongInfo {
  int code;
  int ts;
  Info req;

  SongInfo({
    this.code,
    this.ts,
    this.req
  });

  factory SongInfo.fromJson(Map<String,dynamic> parsedJson) {
    return SongInfo(
      code: parsedJson['code'],
      ts: parsedJson['ts'],
      req: Info.fromJson(parsedJson['req_0'])
    );
  }
}

class Info {
  int code;
  Data data;

  Info({
    this.code,
    this.data
  });

  factory Info.fromJson(Map<String,dynamic> parsedJson) {
    return Info(
      code: parsedJson['code'],
      data: Data.fromJson(parsedJson['data'])
    );
  }
}

class Data {
  int expiration;
  String loginKey;
  List<UrlInfo> midurlinfo;
  String msg;
  int retcode;
  String servercheck;
  List sip;
  String testfile2g;
  String testfilewifi;
  List<String> thirdip;
  String uin;
  int verifyType;

  Data({
    this.uin,
    this.expiration,
    this.loginKey,
    this.midurlinfo,
    this.msg,
    this.retcode,
    this.servercheck,
    this.sip,
    this.testfile2g,
    this.testfilewifi,
    this.thirdip,
    this.verifyType,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {

    var thirdip  = parsedJson['thirdip'];
    List<String> thirdipList = new List<String>.from(thirdip);

    var sip  = parsedJson['sip'];
    List<String> sipList = new List<String>.from(sip);

    var midurlinfo = parsedJson['midurlinfo'] as List;
    List<UrlInfo> urlInfoList = midurlinfo.map((i) => UrlInfo.fromJson(i)).toList();

    return Data(
      uin: parsedJson['uin'],
      expiration: parsedJson['expiration'],
      loginKey: parsedJson['login_key'],
      midurlinfo: urlInfoList,
      msg: parsedJson['msg'],
      retcode: parsedJson['retcode'],
      servercheck: parsedJson['servercheck'],
      sip: sipList,
      testfile2g: parsedJson['testfile2g'],
      testfilewifi: parsedJson['testfilewifi'],
      thirdip: thirdipList,
      verifyType: parsedJson['verify_type'],
    );
  }
}


class UrlInfo {
  int commonDownfromtag;
  String errtype;
  String filename;
  String flowfromtag;
  String flowurl;
  int hisbuy;
  int hisdown;
  int isbuy;
  int isonly;
  int onecan;
  String opi128kurl;
  String opi192koggurl;
  String opi192kurl;
  String opi48kurl;
  String opi30surl;
  String opi96kurl;
  String opiflackurl;
  int p2pfromtag;
  int pdl;
  int pneed;
  int pneedbuy;
  int premain;
  String purl; 
  int qmdlfromtag;
  int result;
  String songmid;
  String tips;
  int uiAlert;
  int vipDownfromtag;
  String vkey;
  String wififromtag;
  String wifiurl;
  
  UrlInfo({
    this.isonly,
    this.songmid,
    this.commonDownfromtag,
    this.errtype,
    this.filename,
    this.flowfromtag,
    this.flowurl,
    this.hisbuy,
    this.hisdown,
    this.isbuy,
    this.onecan,
    this.opi128kurl,
    this.opi192koggurl,
    this.opi192kurl,
    this.opi48kurl,
    this.opi30surl,
    this.opi96kurl,
    this.opiflackurl,
    this.p2pfromtag,
    this.pdl,
    this.pneed,
    this.pneedbuy,
    this.premain,
    this.purl,
    this.qmdlfromtag,
    this.result,
    this.tips,
    this.uiAlert,
    this.vipDownfromtag,
    this.vkey,
    this.wififromtag,
    this.wifiurl
  });
  factory UrlInfo.fromJson(Map<String, dynamic> parsedJson) {
    return UrlInfo(
      isonly: parsedJson['isonly'],
      songmid: parsedJson['songmid'],
      commonDownfromtag: parsedJson['common_downfromtag'],
      errtype: parsedJson['errtype'],
      filename: parsedJson['filename'],
      flowfromtag: parsedJson['flowfromtag'],
      flowurl: parsedJson['flowurl'],
      hisbuy: parsedJson['hisbuy'],
      hisdown: parsedJson['hisdown'],
      isbuy: parsedJson['isbuy'],
      onecan: parsedJson['onecan'],
      opi128kurl: parsedJson['opi128kurl'],
      opi192koggurl: parsedJson['opi192koggurl'],
      opi30surl: parsedJson['opi30surl'],
      opi192kurl: parsedJson['opi192kurl'],
      opi48kurl: parsedJson['opi48kurl'],
      opi96kurl: parsedJson['opi96kurl'],
      opiflackurl: parsedJson['opiflackurl'],
      p2pfromtag: parsedJson['p2pfromtag'],
      pdl: parsedJson['pdl'],
      pneed: parsedJson['pneed'],
      pneedbuy: parsedJson['pneedbuy'],
      premain: parsedJson['premain'],
      purl: parsedJson['purl'],
      qmdlfromtag: parsedJson['qmdlfromtag'],
      result: parsedJson['result'],
      tips: parsedJson['tips'],
      uiAlert: parsedJson['uiAlert'],
      vipDownfromtag: parsedJson['vip_downfromtag'],
      vkey: parsedJson['vkey'],
      wififromtag: parsedJson['wififromtag'],
      wifiurl: parsedJson['wifiurl']
    );
  }
}