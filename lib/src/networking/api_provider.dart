import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/seed.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://sf-code-challenge.herokuapp.com";

  Future<Seed> getSeed() async {
    final response = await client.get("$_baseUrl/api/seed");
    if (response.statusCode == 200) {
      return Seed.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get seed');
    }
  }
}