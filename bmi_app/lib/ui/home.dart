import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageTextEditingController =
      new TextEditingController();
  final TextEditingController _heightTextEditingController =
      new TextEditingController();
  final TextEditingController _weightTextEditingController =
      new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  void _calculate() {
    setState(() {
      int age = int.parse(_ageTextEditingController.text);
      double height = double.parse(_heightTextEditingController.text);
      inches = height * 12;
      double weight = double.parse(_weightTextEditingController.text);

      if ((_ageTextEditingController.text.isNotEmpty || age > 0) &&
          ((_heightTextEditingController.text.isNotEmpty || inches > 0) &&
              (_weightTextEditingController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703; // BMI Calculation

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great Shape!";
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30) {
          _resultReading = "Obese";
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              color: Colors.grey.shade300,
              margin: const EdgeInsets.all(3.0),
              height: 246.2,
              width: 90.0,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g. 34',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: _heightTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height in feet',
                        hintText: 'e.g. 6.5',
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new TextField(
                    controller: _weightTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight in lbs',
                        hintText: 'e.g. 180',
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.6)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                        onPressed: _calculate,
                        color: Colors.pinkAccent,
                        textColor: Colors.white,
                        child: new Text(
                          "Calculate",
                          style: new TextStyle(fontSize: 14.0),
                        )),
                  ),
                ],
              ),
            ),
            new Container(
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new Text(
                    "$_finalResult",
                    style: new TextStyle(
                        fontSize: 19.9,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                  new Padding(padding: const EdgeInsets.all(5.0)),
                  new Text(
                    "$_resultReading",
                    style: new TextStyle(
                        fontSize: 19.9,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
