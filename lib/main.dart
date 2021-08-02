import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/final_result.dart';
import 'quizbrain.dart';
import 'final_result.dart';

Quizbrain quizbrain = Quizbrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade700,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int count = 0;
  List<Widget> score = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.gettext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  if (quizbrain.isFinished() == true) {
                    print(count);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                final_result(finalscore: count)));

                    quizbrain.reset();
                    score = [];
                  } else {
                    bool answer = quizbrain.getans();
                    if (answer == true) {
                      setState(() {
                        count++;
                        quizbrain.nextquestion();
                        score.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        quizbrain.nextquestion();
                        score.add(
                          Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                  }
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  bool answer = quizbrain.getans();
                  if (quizbrain.isFinished() == true) {
                    print(count);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => final_result(
                                  finalscore: count,
                                )));

                    quizbrain.reset();
                    score = [];
                  } else {
                    if (answer == false) {
                      setState(() {
                        count++;
                        quizbrain.nextquestion();
                        score.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        quizbrain.nextquestion();
                        score.add(
                          Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                  } //The user picked false.
                }),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}
