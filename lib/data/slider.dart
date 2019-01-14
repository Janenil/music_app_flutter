
class Property {
  int code;
  Data data;

  Property({
    this.code,
    this.data
  });

  factory Property.fromJson(Map<String, dynamic> parsedJson){
    return Property(
      code: parsedJson['code'],
      data: Data.fromJson(parsedJson['data'])
    );
  }
}

class Data {
  final List<ObjectList> radioList;
  final List<ObjectList> slider;
  final List<String> songList;

  Data({
    this.radioList,
    this.slider,
    this.songList
  });
  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var songList  = parsedJson['songList'];
    List<String> songLists = new List<String>.from(songList);

    var radioList = parsedJson['radioList'] as List;
    // print(radioList.runtimeType); //returns List<dynamic>
    List<ObjectList> radioLists = radioList.map((i) => ObjectList.fromJson(i)).toList();


    var slider = parsedJson['slider'] as List;
    // print(slider.runtimeType); //returns List<dynamic>
    List<ObjectList> sliders = slider.map((i) => ObjectList.fromJson(i)).toList();

    return new Data(
      radioList: radioLists,
      slider: sliders,
      songList: songLists,
    );
  }

}

class ObjectList {
  final int id;
  final String linkUrl;
  final String picUrl;

  ObjectList({
    this.id,
    this.linkUrl,
    this.picUrl
  });

  factory ObjectList.fromJson(Map<String, dynamic> parsedJson){
    return ObjectList(
      id:parsedJson['id'],
      linkUrl:parsedJson['linkUrl'],
      picUrl:parsedJson['picUrl'],
    );
  }
}
