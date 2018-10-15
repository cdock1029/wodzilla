import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchTimer extends StatefulWidget {
  final Duration duration = Duration(milliseconds: 50);
  @override
  _StopwatchTimerState createState() => _StopwatchTimerState();
}

class _StopwatchTimerState extends State<StopwatchTimer> {
  Timer _timer;
  double _seconds;

  @override
  void initState() {
    super.initState();
    _seconds = 0.0;
  }

  void resetTimer() {
    setState(() {
      _timer?.cancel();
      _seconds = 0.0;
    });
  }

  void startTimer() {
    setState(() {
      _timer?.cancel();
      _timer = Timer.periodic(widget.duration, updateTime);
    });
  }

  void stopTimer() {
    setState(() {
      _timer?.cancel();
    });
  }

  void updateTime(Timer t) {
    setState(() {
      _seconds += 0.05;
    });
  }

  bool isActive() {
    return _timer != null && _timer.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 48.0),
                child: Text(
                  _seconds.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    child: Text("RESET"),
                    onPressed: resetTimer,
                    color: Colors.deepPurpleAccent.shade400,
                  ),
                  RaisedButton(
                      color: isActive()
                          ? Colors.redAccent.shade400
                          : Colors.tealAccent.shade700,
                      child: Text(isActive() ? "STOP" : "START"),
                      onPressed: () {
                        isActive() ? stopTimer() : startTimer();
                      })
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
