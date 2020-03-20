import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lightBlue,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('CoronaGo', style: new TextStyle(color: Colors.white, fontSize: 60.0, fontWeight: FontWeight.bold),),
            new SizedBox(height: 50.0,),
            new Text('Tap to start!', style: new TextStyle(color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}