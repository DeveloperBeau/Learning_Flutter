import 'package:flutter/material.dart';
import 'package:quake/ui/quake_widget.dart';
import 'package:quake/style/app_colors.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Quakes"),
      centerTitle: true,
      backgroundColor: AppColors.appBar,
    ),
    body: QuakeWidget(),
  ),
));
