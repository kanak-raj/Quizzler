import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'reusable.dart';

class final_result extends StatefulWidget {
  final_result({@required this.finalscore});
  final int finalscore;
  @override
  _final_resultState createState() => _final_resultState();
}

class _final_resultState extends State<final_result> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade700,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.pinkAccent.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.bottomLeft,
                            child: Center(
                              child: Text(
                                'Quizzler',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: reusable(
                            colour: Color(0xFF9699A9),
                            cardwidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your Score",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50.0,
                                  ),
                                ),
                                Text(
                                  "${widget.finalscore}",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: double.infinity,
                        ),
                        BottomAppBar(
                          color: Colors.blue,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Re-Attempt",
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
