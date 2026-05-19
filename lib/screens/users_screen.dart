import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../providers/users_provider.dart';
import 'widgets/error_view.dart';
import 'widgets/loading_view.dart';
import 'widgets/user_card.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(usersProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              onChanged: (value) =>
                  ref.read(searchQueryProvider.notifier).state = value,
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search, color: colorScheme.secondary),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(usersProvider),
          ),
        ],
      ),
      body: usersAsyncValue.when(
        data: (users) {
          final filteredUsers = users.where((user) {
            return user.name.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

          if (filteredUsers.isEmpty) {
            return Center(
              child: Text(
                'No users found',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(usersProvider),
            child: ListView.builder(
              itemCount: filteredUsers.length,
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemBuilder: (context, index) {
                return UserCard(user: filteredUsers[index]);
              },
            ),
          );
        },
        loading: () => const LoadingView(),
        error: (error, stackTrace) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(usersProvider),
        ),
      ),
    );
  }
}
