import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  final http.Client _client;
  static const String _baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://jsonplaceholder.typicode.com',
  );

  const ApiService(this._client);

  static List<User>? _cachedUsers;

  Stream<List<User>> getUsers() async* {
    if (_cachedUsers != null) {
      yield _cachedUsers!;
    }

    try {
      final uri = Uri.parse('$_baseUrl/users');
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);
        final users = decodedJson
            .map((dynamic item) => User.fromJson(item as Map<String, dynamic>))
            .toList();
        _cachedUsers = users;
        yield users;
      } else {
        if (_cachedUsers == null) {
          throw Exception(
            'Server returned status code: ${response.statusCode}',
          );
        }
      }
    } catch (e) {
      if (_cachedUsers == null) {
        rethrow;
      }
    }
  }
}
