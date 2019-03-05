class Seed {
  String _seed;
  DateTime _expiresAt;

  Seed() {}
  Seed.fromJson(Map<String, dynamic> json) {
    _seed = json['seed'];
    _expiresAt = json['expires_at'];
  }

  String get seed => _seed;

  set seed(String value) {
    _seed = value;
  }

  DateTime get expiresAt => _expiresAt;

  set expiresAt(DateTime value) {
    _expiresAt = value;
  }
}