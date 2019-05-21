import 'package:event_bus/event_bus.dart';
import '../data/album.dart';
EventBus eventBus = new EventBus();

class MyEvent {
  String text;
  List<SongList> list;
  MyEvent(this.text,this.list);
}
