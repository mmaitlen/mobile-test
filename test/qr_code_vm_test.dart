import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generator/src/models/seed.dart';
import 'package:qr_generator/src/view_models/qr_code_view_model.dart';
import 'package:qr_generator/src/data/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MockRepository extends Mock implements Repository {

  Future<Seed> getQRCodeSeed() async {
    var seed = Seed();
    seed.seed = "224106acecedd99f187ca9707cf16cc2";
    seed.expiresAt = DateTime.parse("2019-03-03T16:57:53.109Z");

    return seed;
  }
}

void main() {
  test('Get seed should return a alpha numberic string of 32 length', () {
    final vm = QrCodeViewModel(new MockRepository());
    vm.seed.listen((s) {
      expect(s.seed , "224106acecedd99f187ca9707cf16cc2");
    });
    vm.getSeed();
  });

  test('Ensure seed is of 32 length', () {
    final vm = QrCodeViewModel(new MockRepository());
    vm.seed.listen((s) {
      expect(s.seed.length , 32);
    });
    vm.getSeed();
  });

  test('Ensure QrImage is generated.', () async {
    final vm = QrCodeViewModel(new MockRepository());
    QrImage qrImage = await vm.generateQrCode();
    expect(qrImage != null, true);
  });

  test('Validate valida QR code data has expired.', () async {
    //expired date of 3-3-2019
    final qrCodeData = "224106acecedd99f187ca9707cf16cc2.2019-03-03T16:57:53.109Z";
    final vm = QrCodeViewModel(new MockRepository());
    expect(vm.isQrCodeValid(qrCodeData), false);
  });

  test('Validate valida QR code data has not expired.', () async {
    //future date of 3-3-2020
    final qrCodeData = "224106acecedd99f187ca9707cf16cc2.2020-03-03T16:57:53.109Z";
    final vm = QrCodeViewModel(new MockRepository());
    expect(vm.isQrCodeValid(qrCodeData), true);
  });
}