import 'dart:convert';
import 'package:http/http.dart';

import '../../core/values/app_assets.dart';

class DogProvider {
  DogProvider(this.client);
  final Client client;

  Future<Map<String, dynamic>> fetchBreedsDogs() async {
    final String endpoint = '/v2/breeds';
    final url = Uri.parse('${AppAssets.baseUrl}$endpoint');
    try {
      final response = await client.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerException(
          'Error al cargar los datos. \tError:${response.statusCode}',
          response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      } else {
        throw ConnectionException(e.toString());
      }
    }
  }
}

class ServerException implements Exception {
  ServerException(this.message, this.statusCode);
  int statusCode;
  String message;
}

class ConnectionException implements Exception {
  ConnectionException(this.message);
  String message;
}
