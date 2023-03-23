import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/state_notifier_providerv1.dart';

class UserInfoScreen extends ConsumerWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - State Notifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            TextField(
              onChanged: (value) {
                ref.read(userProvider.notifier).updateFirstName(value);
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'Last Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            TextField(
              onChanged: (value) {
                ref.read(userProvider.notifier).updateLastName(value);
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            TextField(
              onChanged: (value) {
                ref.read(userProvider.notifier).updateEmail(value);
              },
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                final user = ref.watch(userProvider);
                final buttonText =
                    user.firstName.isEmpty || user.lastName.isEmpty
                        ? 'Update User'
                        : '${user.firstName} ${user.lastName}';
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(buttonText)));
              },
              child: const Text('Show User Info'),
            ),
          ],
        ),
      ),
    );
  }
}
