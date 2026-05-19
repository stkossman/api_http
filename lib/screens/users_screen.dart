import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_strings.dart';
import '../providers/users_provider.dart';
import 'widgets/error_view.dart';
import 'widgets/user_card.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usersAsyncValue = ref.watch(usersProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.usersTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: AppStrings.searchUsers,
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
            return user.name.toLowerCase().contains(_searchQuery.toLowerCase());
          }).toList();

          if (filteredUsers.isEmpty) {
            return Center(
              child: Text(
                AppStrings.noUsersFound,
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(usersProvider),
        ),
      ),
    );
  }
}
