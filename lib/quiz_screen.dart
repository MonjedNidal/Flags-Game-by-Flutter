import 'package:flags/result_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
//import 'result_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//to count true answers and false answers to pass them to the resault screen
var trueAnswers = 0;
var falseAnswers = 0;

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

int counter = Random().nextInt(3);

class _QuizScreenState extends State<QuizScreen> {
  //Countries names list
  List countries = [
    'Estonia',
    'France',
    'Germany',
    'Ireland',
    'Italy',
    'Monaco',
    'Nigeria',
    'Poland',
    'Russia',
    'Spain',
    'UK',
    'US',
    'Ethiopia',
    'Afghanistan',
    'Australia',
    'Croatia',
    'Hungary',
    'Jamaica',
    'Malaysia',
    'Palestine',
    'Philippines',
  ];

  @override
  void initState() {
    super.initState();
    countries.shuffle();
  }

  Future trueAlert() async {
    if (trueAnswers == 5 && falseAnswers == 0) {
      return Alert(context: context, title: "True", desc: "Flutter is awesome.")
          .show();
    } else if (trueAnswers == 0 && falseAnswers == 5) {
      return Alert(
              context: context, title: "False", desc: "Flutter is awesome.")
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[500],
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 65,
            ),
            const Text(
              'Guess The Flag!',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Comfortaa'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              countries[counter],
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'Comfortaa'),
            ),
            const SizedBox(
              height: 17,
            ),
            for (int i = 0; i < 3; i++)
              TextButton(
                  onPressed: () {
                    if (i == counter) {
                      trueAnswers++;
                      Fluttertoast.showToast(
                        msg: "True Answer!",
                      );
                    } else {
                      falseAnswers++;
                      Fluttertoast.showToast(
                        msg: "Wrong Answer!",
                      );
                    }
                    setState(() {
                      trueAlert();
                      countries.shuffle();
                      counter = Random().nextInt(3);
                    });
                  },
                  child: Image.asset(
                    'images/${countries[i]}.png',
                    height: 150,
                  )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                child: const Text(
                  'Result',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

