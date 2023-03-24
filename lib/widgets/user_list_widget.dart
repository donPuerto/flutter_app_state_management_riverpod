import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserListWidget extends StatelessWidget {
  final List<User> userList;

  const UserListWidget({super.key, required this.userList});

  @override
  Widget build(BuildContext context) {
    try {
      return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return Card(
            child: ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              leading: const Icon(Icons.person),
            ),
          );
        },
      );
    } catch (error) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('An error occurred: $error')),
      );
    }
  }
}
