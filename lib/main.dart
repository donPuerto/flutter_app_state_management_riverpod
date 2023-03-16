import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/demo_provider.dart';

final helloWorldProvider = Provider((_) => 'world');

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: Main()),
  );
}

class Main extends ConsumerWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(greetingsProvider);
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        appBar: AppBar(
            title:
                const Text('Riverpod - using Provider with statelesswidget')),
        body: Center(
          child: Text('Hello $value'),
        ),
      ),
    );
  }
}
