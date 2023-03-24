import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'screens/greeting_screen.dart';

// import 'screens/counter_screen.dart';
import 'screens/http_service.dart';
//import 'screens/todo_screen.dart';
// import 'screens/user_info_screen.dart';

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: Main()),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Riverpod Tutorial',
      home: HttpService(),
    );
  }
}
