import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../providers/data_provider.dart';
import 'home_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - Api State Fetch Management'),
      ),
      body: data.when(
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomeDetailScreen(
                                    e: userList[index],
                                  ),
                                ),
                              ),
                              child: Card(
                                color: Colors.blueAccent,
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  title: Text(
                                    '${userList[index].firstname} ${userList[index].lastname}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    userList[index].email,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  trailing: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userList[index].avatar),
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: (() {
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
