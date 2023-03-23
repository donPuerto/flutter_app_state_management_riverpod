


import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState extends StateNotifier<User> {
  UserState() : super(User());

  void updateFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void updateLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }
}

class User {
  String firstName;
  String lastName;
  String email;

  User({this.firstName = '', this.lastName = '', this.email = ''});

  User copyWith({String? firstName, String? lastName, String? email}) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }
}

final userProvider =
    StateNotifierProvider<UserState, User>((ref) => UserState());
