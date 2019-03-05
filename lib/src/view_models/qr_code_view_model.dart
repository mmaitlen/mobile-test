import '../data/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/seed.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeViewModel {
  var _repository;
  final _seedStream = PublishSubject<Seed>();

  QrCodeViewModel(Repository repo) {
    _repository = repo;
  }

  Observable<Seed> get seed => _seedStream.stream;

  getSeed() async {
    Seed seed = await _repository.getQRCodeSeed();
    _seedStream.sink.add(seed);
  }

  Future<QrImage> generateQrCode() async {
    final _seed = await _repository.getQRCodeSeed();
    final _data = _seed.seed + "." + _seed.expiresAt.toString();

    return QrImage(data: _data, size: 100.0);
  }

  bool isQrCodeValid(String qrCodeData) {
    var qrCodeDataParts = qrCodeData.split(".");
    var expireAt = DateTime.parse(qrCodeDataParts[1]);
    var current = DateTime.now().toUtc();
    var difference = current.difference(expireAt);
    return difference.inMinutes < 15; //server expires in 15 mins
  }

  dispose() {
    _seedStream.close();
  }
}