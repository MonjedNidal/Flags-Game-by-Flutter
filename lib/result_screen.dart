import 'package:flutter/material.dart';
import 'quiz_screen.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: const Text('Result'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Correct Answers = $trueAnswers',
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Comfortaa'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Your Wrong Answers = $falseAnswers',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Comfortaa'),
                    ),
                  ],
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,60,0,80),
                child: ElevatedButton(
                    onPressed: () {
                      trueAnswers = 0;
                      falseAnswers = 0;
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Comfortaa'),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.teal[500]),
                    )),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

