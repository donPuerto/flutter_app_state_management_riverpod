import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.watch(userProvider).getUsers();
});
