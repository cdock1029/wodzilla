import 'package:flutter/material.dart';

class IntervalTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IntervalState();
}

class _IntervalState extends State<IntervalTimer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Interval timer")),
      body: Center(
        child: Text("todo"),
      ),
    );
  }
}
