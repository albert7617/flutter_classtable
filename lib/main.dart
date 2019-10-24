import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ClassTable(),
    );
  }
}

class ClassTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('ClassTable'),
      ),
//      body: new SingleChildScrollView(
//        child: new Column(
      body: new Column(
          children: <Widget>[
            new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
//              new Expanded(child: new Text("", textAlign: TextAlign.center), flex: 2,),
                new Expanded(child: new Container(padding: EdgeInsets.symmetric(vertical: 10), child: new Text("", textAlign: TextAlign.center,),), flex: 2,),
                new Expanded(child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: new Text("MON", textAlign: TextAlign.center),
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),
                ), flex: 5,),
                new Expanded(child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: new Text("TUE", textAlign: TextAlign.center),
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),
                ), flex: 5,),
                new Expanded(child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: new Text("WED", textAlign: TextAlign.center),
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),
                ), flex: 5,),
                new Expanded(child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: new Text("THU", textAlign: TextAlign.center),
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),
                ), flex: 5,),
                new Expanded(child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: new Text("FRI", textAlign: TextAlign.center),
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),
                ), flex: 5,),
              ],
            ),
            new Expanded(
              child: SingleChildScrollView(
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Expanded(child: new ClassTableFirstRow(), flex: 2,),
                    new Expanded(child: new ClassTableRow([Lesson(1,"B"), Lesson(1,"D"), Lesson(2,"E")] ), flex: 5,),
                    new Expanded(child: new Container(height: 10.0, color: Colors.red,), flex: 5,),
                    new Expanded(child: new Container(height: 10.0, color: Colors.red,), flex: 5,),
                    new Expanded(child: new Container(height: 10.0, color: Colors.red,), flex: 5,),
                    new Expanded(child: new Container(height: 10.0, color: Colors.red,), flex: 5,),
                  ],
                )
              ),
            ),
          ],
        ),
      //)
    );
  }
}

class ClassTableFirstRow extends StatelessWidget {
  final List<String> _list = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();

    for(String e in _list) {
      children.add(new Container(height: 48.0, child: Text(e, textAlign: TextAlign.center,), alignment: Alignment(0,0),));

    }
    return new Column(children: children);
  }


}


class ClassTableRow extends StatefulWidget {
  List<Lesson> _lessons;
  @override
  State<StatefulWidget> createState() {
    return new ClassTableRowState(_lessons);
  }
  ClassTableRow(List<Lesson> lessons) {
    _lessons = lessons;
  }
}

class ClassTableRowState extends State<ClassTableRow> {
  List<Lesson> _lessons;
  @override
  Widget build(BuildContext context) {
    final List<String> _list = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];
    var period = new Map();

    for(String str in _list) {
      int flag = -1;
      for(Lesson l in _lessons) {
        if(l.period.compareTo(str) == 0) {
          flag = l.l_id;
          print(l.period);
        }
      }
      period[str] = flag;
    }
    List<Widget> children = new List();

    int previous = period["A"];
    double height = 0;
    period.forEach((k,v){
      if(previous == v) {
        height += 48;
      } else {
        if (previous==-1) {
          print(height);
          children.add(new Container(height: height, decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12), top: BorderSide(color: Colors.black12))),));
        } else {
          print(height);
          children.add(new Container(height: height, child: Text(previous.toString(), textAlign: TextAlign.center,), alignment: Alignment(0,0), decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12), top: BorderSide(color: Colors.black12)))));
        }
        height = 48;
      }
      previous = v;
    });
    if (previous==-1) {
      print(height);
      children.add(new Container(height: height, decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12), top: BorderSide(color: Colors.black12))),));
    } else {
      print(height);
      children.add(new Container(height: height, child: Text(previous.toString(), textAlign: TextAlign.center,), alignment: Alignment(0,0), decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12), top: BorderSide(color: Colors.black12)))));
    }
    return new Column(children: children);
  }
  ClassTableRowState(List<Lesson> lessons) {
    _lessons = lessons;
  }
}

class Lesson {
  int l_id;
  String period;
  Lesson(this.l_id, this.period);

}