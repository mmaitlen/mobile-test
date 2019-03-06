import 'package:flutter/material.dart';
import 'package:qr_generator/src/views/qr_scan.dart';
import 'package:qr_generator/src/views/generate_qr.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _scan() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrScan()),
    );
  }

  void _generateQrCode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenerateQrCode()),
    );
  }

  @override
  Widget build(BuildContext context) {

    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
          new Icon(Icons.scanner),
          Colors.blue,
          4.0,
          "Button menu",
          _scan,
          "Scan",
          Colors.blue,
          Colors.white,
          true),
      new FabMiniMenuItem.withText(
          new Icon(Icons.code),
          Colors.blue,
          4.0,
          "Button menu",
          _generateQrCode,
          "QRCode",
          Colors.blue,
          Colors.white,
          true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        //empty body for now
      ),
      floatingActionButton: new FabDialer(_fabMiniMenuItemList, Colors.blue, new Icon(Icons.add)),
    );
  }
}