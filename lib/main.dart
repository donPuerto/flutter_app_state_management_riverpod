import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider((_) => 'world');

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Main());
  }
}

class Main extends ConsumerStatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final greetings = ref.read(helloWorldProvider);
    print(greetings);
  }

  @override
  Widget build(BuildContext context) {
    final greetings = ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statefull using Riverpod '),
      ),
      body: Center(
        child: Text("hello $greetings"),
      ),
    );
  }
}
