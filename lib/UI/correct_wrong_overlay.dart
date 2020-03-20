import 'dart:math';
import 'package:flutter/material.dart';


class CorrectWrongOverlay extends StatefulWidget {
  
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);
  
  
  @override

  State createState() => CorrctWrongOverlayState();
}

class CorrctWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  
  Animation<double> _iconAnimation;
  AnimationController _iconAnimaitonController;

  @override
  void initState() {
    super.initState();

    _iconAnimaitonController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimaitonController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimaitonController.forward();
  }

  @override
  void dispose() {
    _iconAnimaitonController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(color: Colors.white,
              shape: BoxShape.circle),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect == true ? "Correct" : "Wrong", style: new TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold),),
            new SizedBox(height: 150.0,),
            new Text("Click to continue", style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}