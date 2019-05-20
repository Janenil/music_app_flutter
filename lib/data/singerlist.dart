class SingerAllList {
  int code;
  Data data;
  String message;
  int subcode;

  SingerAllList({
    this.data,
    this.message,
    this.subcode,
    this.code
  });

  factory SingerAllList.fromJson(Map<String, dynamic> parsedJson) { 
    return SingerAllList(
      message: parsedJson['message'],
      code: parsedJson['code'],
      subcode: parsedJson['subcode'],
      data: Data.fromJson(parsedJson['data'])
    );
  }
}

class Data {
  List<SingerObj> list;
  int perpage;
  int total;
  int totalpage;

  Data({
    this.list,
    this.perpage,
    this.total,
    this.totalpage
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) { 

    var _list = parsedJson['list'] as List;
    List<SingerObj> list = _list.map((i) => SingerObj.fromJson(i)).toList();
    return Data(
      perpage: parsedJson['perpage'],
      total: parsedJson['total'],
      totalpage: parsedJson['totalpage'],
      list: list
    );
  }
}

class SingerObj {
  String farea;
  String fattribute3;
  String fattribute4;
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

  SingerObj({
    this.farea,
    this.fattribute3,
    this.fattribute4,
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

  factory SingerObj.fromJson(Map<String, dynamic> parsedJson) {
    return SingerObj(
      farea: parsedJson['Farea'],
      fattribute3: parsedJson['Fattribute_3'],
      fattribute4: parsedJson['Fattribute_4'],
      fgenre: parsedJson['Fgenre'],
      findex: parsedJson['Findex'],
      fothername: parsedJson['Fother_name'],
      fsingerid: parsedJson['Fsinger_id'],
      fsingermid: parsedJson['Fsinger_mid'],
      fsingername: parsedJson['Fsinger_name'],
      fsingertag: parsedJson['Fsinger_tag'],
      fsort: parsedJson['Fsort'],
      ftrend: parsedJson['Ftrend'],
      ftype: parsedJson['Ftype'],
      voc: parsedJson['voc']
    );
  }
}