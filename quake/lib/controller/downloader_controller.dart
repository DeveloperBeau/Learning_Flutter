import 'package:quake/interface/downloader.dart';
import 'package:quake/model/quake_model.dart';
import 'package:quake/interface/model_builder.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class DownloaderController implements Downloader {
  @override
  Future<List<Quake>> fetchData({@required String url, @required QuakeBuilder builder}) async {
    http.Response response = await http.get(url);
    List<Quake> listOfModels = builder(json.decode(response.body)["features"]);
    return listOfModels;
  }
}