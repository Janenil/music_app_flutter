class Hotkey {
  int code;
  Data data;
  int subcode;

  Hotkey({
    this.code,
    this.data,
    this.subcode
  });

  factory Hotkey.fromJson(Map<String,dynamic> parsedJson) {
    return Hotkey(
      code: parsedJson['code'],
      subcode: parsedJson['subcode'],
      data: Data.fromJson(parsedJson['data'])
    );
  }
}

class Data {
  List<KeyObj> hotkeylist;
  String specialKey;
  String specialUrl;

  Data({
    this.hotkeylist,
    this.specialKey,
    this.specialUrl
  });

  factory Data.fromJson(Map<String,dynamic> parsedJson) {
    var keylist = parsedJson['hotkey'] as List;
    var list = keylist.map((i) => KeyObj.fromJson(i)).toList();
    return Data(
      specialKey: parsedJson['special_key'],
      specialUrl: parsedJson['special_url'],
      hotkeylist: list
    );
  }
}

class KeyObj {
  String k;
  int n;

  KeyObj({
    this.k,
    this.n
  });

  factory KeyObj.fromJson(Map<String,dynamic> parsedJson) {
    return KeyObj(
      k: parsedJson['k'],
      n: parsedJson['n']
    );
  }
}