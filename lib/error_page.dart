import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;

  ErrorPage({Key key, this.errorMessage}) : super(key: key);
  _ErrorPageState createState() => new _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Error Page",
      theme: new ThemeData(primarySwatch: Colors.amber),
      home: new Scaffold(
        appBar: new AppBar(title: new Text("Error Page"),),
        body: new Center(
          child: new Text(widget.errorMessage),
        ),
        floatingActionButton: new FloatingActionButton(onPressed: ()=>Navigator.pop(context), child: new Icon(Icons.fast_rewind),),
      ),
    );
  }


}