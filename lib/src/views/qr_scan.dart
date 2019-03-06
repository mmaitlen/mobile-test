import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../view_models/qr_code_view_model.dart';

class QrScan extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return QrScanState();
  }
}

class QrScanState extends State<QrScan> {

  String barcode = "";
  String iconPath = "images/ic_valid.png";

  @override
  void initState() {
    super.initState();
    scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top:40.0),
          child: Column(
            children: <Widget>[
              Image.asset(iconPath, width: 75.0, height: 75.0),
              Text(barcode),
            ],
          ),
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        if (viewModel.isQrCodeValid(barcode)) {
          this.barcode = viewModel.validQrCodeMsg;
          this.iconPath = "images/ic_valid.png";
        } else {
          this.barcode = viewModel.invalidQrCodeMsg;
          this.iconPath = "images/ic_invalid.png";
        }

      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}