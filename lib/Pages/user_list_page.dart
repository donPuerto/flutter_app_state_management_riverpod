import 'package:flutter/material.dart';

import '../model/user_model.dart';

import '../widgets/user_card.dart';

class UserListPage extends StatefulWidget {
  final List<User> userList;
  const UserListPage({Key? key, required this.userList}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> userList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: userList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return UserCard(user: userList[index]);
              },
            ),
    );
  }
}
