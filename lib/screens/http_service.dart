import 'dart:convert';

import 'package:flutter/material.dart';

import '../Pages/user_list_page.dart';
import '../components/app_button.dart';
import '../model/user_model.dart';
import '../network/api_service.dart';

class HttpService extends StatelessWidget {
  const HttpService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Tutorial'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const FlutterLogo(size: 72),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () async {
                  var response =
                      await BaseClient().get('/users').catchError((err) {});
                  if (response == null) return;

                  final responseList = jsonDecode(response);
                  final userList = List<User>.from(
                      responseList.map((userJson) => User.fromJson(userJson)));
                  //print(userList);
                  Future.microtask(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            UserListPage(userList: userList),
                      ),
                    );
                  });
                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add user',
                onPressed: () async {
                  debugPrint('successful:');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
