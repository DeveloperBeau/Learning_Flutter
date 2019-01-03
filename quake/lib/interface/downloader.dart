import 'package:quake/interface/model_builder.dart';
import 'package:quake/model/quake_model.dart';

abstract class Downloader {
  Future<List<Quake>> fetchData({String url, QuakeBuilder builder});
}