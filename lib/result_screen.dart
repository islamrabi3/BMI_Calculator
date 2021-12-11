import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  int? ageR;
  double? resultR;

  ResultScreen({
    Key? key,
    required this.ageR,
    required this.resultR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result '),
      ),
      body: Center(
          child: Card(
        elevation: 5.0,
        child: Container(
          height: 200.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Age :$ageR ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Result :${resultR!.toInt()} ',
                style: TextStyle(fontSize: 20.0),
              ),
              if (resultR! <= 20.0)
                Text(
                  'Very Good',
                  style: TextStyle(fontSize: 20.0),
                ),
              if (resultR! >= 20.0)
                Text(
                  ' Good',
                  style: TextStyle(fontSize: 20.0),
                ),
              if (resultR! >= 30.0)
                Text(
                  ' bad',
                  style: TextStyle(fontSize: 20.0),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
