import 'package:intl/intl.dart';

class Quake {
  final String magnitude;
  final String place;
  final int time;
  final String description;

  Quake(this.magnitude, this.place, this.time, this.description);

  Quake.fromJson(Map<String, dynamic> json)
      : magnitude = json['mag'].toString(),
        place = json['place'],
        time = json['time'],
        description = json['title'];

  Map<String, dynamic> toJson() =>
      {
        'mag': magnitude,
        'place': place,
        'time': time,
        'title': description
      };

  String getTime() {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(this.time);
    var format = DateFormat.yMMMMd("en_US").add_jm();
    return format.format(date);
  }
}