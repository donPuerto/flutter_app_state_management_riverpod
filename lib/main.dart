import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/demo_provider.dart';

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: Main()),
  );
}

/*
  Two options we can do here,
  (1) using ConsumerWidget
  (2) using Consumer
*/
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
