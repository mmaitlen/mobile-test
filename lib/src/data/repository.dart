import 'dart:async';
import '../networking/api_provider.dart';
import '../models/seed.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<Seed> getQRCodeSeed() => apiProvider.getSeed();
}