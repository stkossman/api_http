import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../constants/app_strings.dart';

class UserDetailDialog extends StatelessWidget {
  final User user;

  const UserDetailDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
            child: Text(user.name.isNotEmpty ? user.name[0] : '?'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              user.name,
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.email_outlined, color: colorScheme.secondary),
              title: const Text(AppStrings.email),
              subtitle: Text(user.email),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.phone_outlined, color: colorScheme.secondary),
              title: const Text(AppStrings.phone),
              subtitle: Text(user.phone),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.business_outlined,
                color: colorScheme.secondary,
              ),
              title: const Text(AppStrings.company),
              subtitle: Text(user.companyName),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.language_outlined,
                color: colorScheme.secondary,
              ),
              title: const Text(AppStrings.website),
              subtitle: Text(user.website),
            ),
            const Divider(height: 24),
            Text(AppStrings.address, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(user.address.formatted, style: textTheme.bodyMedium),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(AppStrings.close),
        ),
      ],
    );
  }
}
