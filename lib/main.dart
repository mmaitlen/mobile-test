import 'package:flutter/material.dart';
import 'package:qr_generator/src/views/generate_qr.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _add() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenerateQrCode()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        //empty body for now
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
