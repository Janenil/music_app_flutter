
class ListProperty {
  int code;
  int subcode;
  String message;
  int defaultcode;
  Data data;

  ListProperty({
    this.code,
    this.subcode,
    this.message,
    this.defaultcode,
    this.data
  });

  factory ListProperty.fromJson(Map<String, dynamic> parsedJson){
    return ListProperty(
      code: parsedJson['code'],
      subcode: parsedJson['subcode'],
      message: parsedJson['message'],
      defaultcode: parsedJson['default'],
      data: Data.fromJson(parsedJson['data'])
    );
  }
}

class Data {
  int uin;
  int categoryId;
  int sortId;
  int sum;
  int sin;
  int ein;
  final List<ObjectList> list;

  Data({
    this.uin,
    this.categoryId,
    this.sortId,
    this.sum,
    this.sin,
    this.ein,
    this.list,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var radioList = parsedJson['list'] as List;
    // print(radioList.runtimeType); //returns List<dynamic>
    List<ObjectList> list = radioList.map((i) => ObjectList.fromJson(i)).toList();


    return new Data(
      uin: parsedJson['uin'],
      categoryId: parsedJson['categoryId'],
      sortId: parsedJson['sortId'],
      sum: parsedJson['sum'],
      sin: parsedJson['sin'],
      ein: parsedJson['ein'],
      list: list,
    );
  }

}

class ObjectList {
  final String dissid;
  final String createtime;
  final String committime;
  final String dissname;
  final String imgurl;
  final String introduction;
  final int listennum;
  final int score;
  final int version;
  Creator creator;


  ObjectList({
    this.dissid,
    this.createtime,
    this.committime,
    this.dissname,
    this.imgurl,
    this.introduction,
    this.listennum,
    this.score,
    this.version,
    this.creator
  });

  factory ObjectList.fromJson(Map<String, dynamic> parsedJson){
    return ObjectList(
      dissid:parsedJson['dissid'],
      createtime:parsedJson['createtime'],
      committime:parsedJson['commit_time'],
      dissname:parsedJson['dissname'],
      imgurl:parsedJson['imgurl'],
      introduction:parsedJson['introduction'],
      listennum:parsedJson['listennum'],
      score:parsedJson['score'],
      version:parsedJson['version'],
      creator: Creator.fromJson(parsedJson['creator']),
    );
  }
}


class Creator {
  int type;
  int qq;
  String encryptuin;
  String name;
  int isVip;
  String avatarUrl;
  int followflag;

  Creator({
    this.type,
    this.qq,
    this.encryptuin,
    this.name,
    this.isVip,
    this.avatarUrl,
    this.followflag
  });

  factory Creator.fromJson(Map<String, dynamic> parsedJson){
    return Creator(
      type: parsedJson['type'],
      qq: parsedJson['qq'],
      encryptuin: parsedJson['encrypt_uin'],
      name: parsedJson['name'],
      isVip: parsedJson['isVip'],
      avatarUrl: parsedJson['avatarUrl'],
      followflag: parsedJson['followflag']
    );
  }
}