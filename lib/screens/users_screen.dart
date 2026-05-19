import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_strings.dart';
import '../providers/users_provider.dart';
import 'widgets/error_view.dart';
import 'widgets/user_card.dart';
import 'widgets/dot_pattern_painter.dart';

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
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courier',
                ),
                decoration: InputDecoration(
                  hintText: AppStrings.searchUsers,
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorScheme.onSurface,
                    size: 28,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
      body: DotPatternBackground(
        child: usersAsyncValue.when(
          data: (users) {
            final filteredUsers = users.where((user) {
              return user.name.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              );
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
      ),
    );
  }
}
