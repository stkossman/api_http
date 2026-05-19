import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/users_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: UsersApp()));
}

class UsersApp extends StatelessWidget {
  const UsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users API',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const UsersScreen(),
    );
  }
}
