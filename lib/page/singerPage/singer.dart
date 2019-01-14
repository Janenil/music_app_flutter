class Singer {
  int code;
  Data data;
  String message;
  int subcode;

  Singer({
    this.data,
    this.code,
    this.message,
    this.subcode
  });

  factory Singer.fromJson(Map<String, dynamic> parsedJson) {
    return Singer (
      data: Data.fromJson(parsedJson['data']),
      code: parsedJson['code'],
      message: parsedJson['message'],
      subcode: parsedJson['subcode']
    );
  }
}

class Data {
  List<SingerInfo> list;
  int perPage;
  int total;
  int totalPage;

  Data({
    this.list,
    this.perPage,
    this.total,
    this.totalPage
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['list'] as List;
    var _list = list.map((i) => SingerInfo.fromJson(i)).toList();
    return Data(
      list: _list,
      perPage: parsedJson['per_page'],
      total: parsedJson['total'],
      totalPage: parsedJson['total_page']
    );
  }
}

class SingerInfo {
  String farea;
  String fattribute_3;
  String fattribute_4;
  String fgenre;
  String findex;
  String fothername;
  String fsingerid;
  String fsingermid;
  String fsingername;
  String fsingertag;
  String fsort;
  String ftrend;
  String ftype;
  String voc;

  SingerInfo({
    this.farea,
    this.fattribute_3,
    this.fattribute_4,
    this.fgenre,
    this.findex,
    this.fothername,
    this.fsingerid,
    this.fsingermid,
    this.fsingername,
    this.fsingertag,
    this.fsort,
    this.ftrend,
    this.ftype,
    this.voc
  });

  factory SingerInfo.fromJson(Map<String, dynamic> parsedJson) {
    return SingerInfo(
      farea: parsedJson['Fares'],
      fattribute_3: parsedJson['Fattribute_3'],
      fattribute_4: parsedJson['Fattribute_4'],
      fgenre: parsedJson['Fgenre'],
      findex: parsedJson['Findex'],
      fothername: parsedJson['Fother_name'],
      fsingertag: parsedJson['Fsinger_tag'],
      fsingermid: parsedJson['Fsinger_mid'],
      fsingerid: parsedJson['Fsinger_id'],
      fsingername: parsedJson['Fsinger_name'],
      fsort: parsedJson['Fsort'],
      ftrend: parsedJson['Ftrend'],
      ftype: parsedJson['Ftrend'],
      voc: parsedJson['voc']
    );
  }
}