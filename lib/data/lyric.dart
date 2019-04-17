class LyricData {
  String announce;
  int error;
  String msg;
  Data data;

  LyricData({
    this.announce,
    this.data,
    this.msg,
    this.error
  });

  factory LyricData.fromJson(Map<String, dynamic> parsedJson) {
    return new LyricData(
      announce: parsedJson['announce'],
      error: parsedJson['error'],
      msg: parsedJson['msg'],
      data: Data.fromJson(parsedJson['data'])
    );
  }
}


class Data {
  String lyric;
  Data({
    this.lyric
  });
  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return new Data(lyric: parsedJson['lyric']);
  }
}