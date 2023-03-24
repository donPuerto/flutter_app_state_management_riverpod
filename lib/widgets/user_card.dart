import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Username: ${user.username}'),
            // Text('Email: ${user.email}'),
            // Text('Street: ${user.street}'),
            // Text('Suite: ${user.suite}'),
            // Text('City: ${user.city}'),
            // Text('Zipcode: ${user.zipcode}'),
            // Text('Latitude: ${user.lat}'),
            // Text('Longitude: ${user.lng}'),
          ],
        ),
      ),
    );
  }
}
