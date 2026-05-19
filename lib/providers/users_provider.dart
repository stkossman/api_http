import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../services/api_service.dart';

part 'users_provider.g.dart';

@riverpod
http.Client httpClient(Ref ref) {
  final client = http.Client();
  ref.onDispose(() => client.close());
  return client;
}

@riverpod
ApiService apiService(Ref ref) {
  final client = ref.watch(httpClientProvider);
  return ApiService(client);
}

@riverpod
Stream<List<User>> users(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getUsers();
}
