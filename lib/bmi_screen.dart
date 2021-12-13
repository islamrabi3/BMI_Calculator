import 'dart:math';

import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  var activeColor = Colors.orange[400];
  var inActiveColor = Colors.grey[400];
  bool isMale = false;
  double heightValue = 120.0;
  int age = 0;
  int weight = 0;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
      ),
      body: Column(
        children: [
          genderSection(),
          heightSection(),
          weightAndAge(),
          SizedBox(
            height: 20.0,
          ),
          buildCalculateButton(context)
        ],
      ),
    );
  }

  Widget weightAndAge() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 170.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: inActiveColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      Text('$weight',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                              heroTag: 'c',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                Icons.plus_one,
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: 'd',
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.exposure_minus_1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: inActiveColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      Text('$age',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                              heroTag: 'a',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.plus_one,
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: 'b',
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(Icons.exposure_minus_1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget heightSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: inActiveColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 170,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'HEIGHT',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${heightValue.round()}',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'cm',
                  ),
                ],
              ),
              Slider(
                  value: heightValue,
                  max: 220.0,
                  onChanged: (value) {
                    setState(() {
                      heightValue = value;
                      print(heightValue);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget genderSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => setState(() {
                isMale = true;
                print(isMale);
              }),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male_outlined,
                      size: 60.0,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: isMale ? activeColor : inActiveColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 140.0,
                // color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: InkWell(
              onTap: () => setState(() {
                isMale = false;
              }),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female_outlined,
                      size: 60.0,
                    ),
                    Text(
                      'Female',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: !isMale ? activeColor : inActiveColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 140.0,
                // color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCalculateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = weight / pow(heightValue / 100, 2);

          print(result);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(
                        ageR: age,
                        resultR: result,
                      )));
        });
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Calculate',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
