import 'package:flutter/material.dart';
import '../view_models/qr_code_view_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return GenerateQrCodeState();
  }
}

class GenerateQrCodeState extends State<GenerateQrCode> {

  @override
  void initState() {
    super.initState();
    viewModel.generateQrCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top:30.0),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: viewModel.qrCode,
                builder: (context, AsyncSnapshot<QrImage> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              StreamBuilder(
                stream: viewModel.expiresAt,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data, style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5));
                  } else if (snapshot.hasError) {
                    return Text('');
                  }
                  return Text('');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}