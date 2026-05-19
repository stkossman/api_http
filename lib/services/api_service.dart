import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  final http.Client _client;
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  const ApiService(this._client);

  Future<List<User>> getUsers() async {
    try {
      final uri = Uri.parse('$_baseUrl/users');
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);
        return decodedJson
            .map((dynamic item) => User.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Server returned status code: ${response.statusCode}');
    } catch (error) {
      throw Exception('Failed to fetch users: $error');
    }
  }
}
