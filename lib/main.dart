import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/users_screen.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF2563EB),
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFDBEAFE),
          onPrimaryContainer: Color(0xFF1E40AF),
          secondary: Color(0xFF64748B),
          onSecondary: Colors.white,
          secondaryContainer: Color(0xFFF1F5F9),
          onSecondaryContainer: Color(0xFF334155),
          surface: Color(0xFFFAFAFA),
          onSurface: Color(0xFF0F172A),
          surfaceContainerHighest: Color(0xFFE2E8F0),
          error: Color(0xFFDC2626),
          onError: Colors.white,
          errorContainer: Color(0xFFFEE2E2),
          onErrorContainer: Color(0xFF991B1B),
          outline: Color(0xFFCBD5E1),
          outlineVariant: Color(0xFFE2E8F0),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0F172A),
          elevation: 0,
          scrolledUnderElevation: 1,
          shadowColor: Color(0x1A000000),
          titleTextStyle: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
          bodyMedium: TextStyle(color: Color(0xFF475569), height: 1.5),
          bodySmall: TextStyle(color: Color(0xFF94A3B8)),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xFF94A3B8)),
        ),
      ),
      home: const UsersScreen(),
    );
  }
}
