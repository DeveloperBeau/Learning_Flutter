import 'package:quake/model/quake_model.dart';
import 'package:quake/controller/downloader_controller.dart';
class QuakeController {
  Future<List> fetchQuakes() async {
    String url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
    DownloaderController downloader = DownloaderController();
    return await downloader.fetchData(url: url, builder: (List<dynamic> json){
      List<Quake> list = List();
      json.forEach((features) => list.add(Quake.fromJson(features["properties"]))
      );
      return list;
    });
  }
}