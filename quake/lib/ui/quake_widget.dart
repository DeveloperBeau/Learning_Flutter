import 'package:flutter/material.dart';
import 'package:quake/controller/quake_controller.dart';
import 'package:quake/model/quake_model.dart';
import 'package:quake/style/app_colors.dart';

class QuakeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuakeState();
  }
}

class QuakeState extends State<QuakeWidget> {
  QuakeController controller = QuakeController();
  List<Quake> quakes = List();
  @override
  Widget build(BuildContext context) {
    fetchQuakes();
    return Center(
        child: quakes.length > 0 ? ListView.builder(
            itemCount: quakes.length,
            padding: const EdgeInsets.all(14.5),
            itemBuilder: (BuildContext context, int position) {
              return Column(
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      "${quakes[position].getTime()}",
                      style: new TextStyle(
                          fontSize: 17.9,
                          color: AppColors.cellTitle,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Text("${quakes[position].place}",
                        style: new TextStyle(
                            fontSize: 13.9,
                            color: AppColors.cellSubtitle,
                            fontStyle: FontStyle.italic)),
                    leading: new CircleAvatar(
                      backgroundColor: AppColors.avatarBackground,
                      child: Text(
                        "${quakes[position].magnitude}",
                        style: new TextStyle(
                            fontSize: 18,
                            color: AppColors.avatarText,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    onTap:() => showonTapMessage(context, quakes[position].description),

                  ),
                  new Divider(height: 5.5)
                ],
              );
            }) : CircularProgressIndicator()
    );
  }

  void showonTapMessage(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: Text("Quakes"),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          }, )
      ],
    );
    // showDialog(context: context, child: alert);
    showDialog(context: context, builder: (context) => alert);
  }

  void fetchQuakes() async {
    List listOfQuakes = await controller.fetchQuakes();
    setState(()  {
      quakes = listOfQuakes;
    });
  }

}