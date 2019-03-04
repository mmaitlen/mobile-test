import '../data/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/seed.dart';

class QrCodeViewModel {
  final _repository = Repository();
  final _seedStream = PublishSubject<Seed>();

  Observable<Seed> get seed => _seedStream.stream;

  getSeed() async {
    Seed seed = await _repository.getQRCodeSeed();
    _seedStream.sink.add(seed);
  }

  dispose() {
    _seedStream.close();
  }
}

final qrCodeViewModel = QrCodeViewModel();