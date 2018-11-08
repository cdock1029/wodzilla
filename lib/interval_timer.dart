import 'package:flutter/material.dart';

const TextStyle textStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);

class IntervalTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IntervalState();
}

class IntervalStateMachine {
  final int sets;
  final int work;
  final int rest;

  IntervalStateMachine({
    this.sets,
    this.work,
    this.rest,
  });

  IntervalStateMachine incWork() {
    return IntervalStateMachine(
      sets: this.sets,
      rest: this.rest,
      work: this.work + 1,
    );
  }

  IntervalStateMachine decWork() {
    return IntervalStateMachine(
      sets: this.sets,
      rest: this.rest,
      work: this.work == 1 ? this.work : this.work - 1,
    );
  }

  IntervalStateMachine incSets() {
    return IntervalStateMachine(
      sets: this.sets + 1,
      rest: this.rest,
      work: this.work,
    );
  }

  IntervalStateMachine decSets() {
    return IntervalStateMachine(
      sets: this.sets == 1 ? this.sets : this.sets - 1,
      rest: this.rest,
      work: this.work,
    );
  }

  IntervalStateMachine incRest() {
    return IntervalStateMachine(
      sets: this.sets,
      rest: this.rest + 1,
      work: this.work,
    );
  }

  IntervalStateMachine decRest() {
    return IntervalStateMachine(
      sets: this.sets,
      rest: this.rest == 0 ? this.rest : this.rest - 1,
      work: this.work,
    );
  }
}

class _IntervalState extends State<IntervalTimer> {
  IntervalStateMachine initial;
  IntervalStateMachine curr;

  @override
  void initState() {
    super.initState();
    initial = curr = IntervalStateMachine(sets: 1, work: 1, rest: 0);
  }

  void reset() {
    setState(() {
      curr = initial;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Interval timer")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: double.infinity),
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sets",
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text("<-"),
                          onPressed: () {
                            setState(() {
                              curr = curr.decSets();
                            });
                          },
                        ),
                        Text(curr.sets.toString()),
                        FlatButton(
                          child: Text("->"),
                          onPressed: () {
                            setState(() {
                              curr = curr.incSets();
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Work",
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text("<-"),
                          onPressed: () {
                            setState(() {
                              curr = curr.decWork();
                            });
                          },
                        ),
                        Text(curr.work.toString()),
                        FlatButton(
                          child: Text("->"),
                          onPressed: () {
                            setState(() {
                              curr = curr.incWork();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rest",
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text("<-"),
                          onPressed: () {
                            setState(() {
                              curr = curr.decRest();
                            });
                          },
                        ),
                        Text(curr.rest.toString()),
                        FlatButton(
                          child: Text("->"),
                          onPressed: () {
                            setState(() {
                              curr = curr.incRest();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
