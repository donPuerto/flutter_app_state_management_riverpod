import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/snackbar_component.dart';
import '../providers/provider.dart';

class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String greet = ref.read(greetingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - (1) Provider'),
      ),
      body: Center(
        child: Text('hello $greet'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackbarComponent(
            content: "hello $greet",
            behavior: SnackBarBehavior.fixed,
          ));
        },
        tooltip: 'Greetings',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
  Two options we can do here,
  (1) using ConsumerWidget
  (2) using Consumer
*/

// Consumer Widget Example
/*
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
*/

// Consumer Functiion Example

// class Main extends StatelessWidget {
//   const Main({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Riverpod Tutorial',
//       home: Scaffold(
//         appBar: AppBar(
//             title:
//                 const Text('Riverpod - using Provider with statelesswidget')),
//         body: Center(
//           child: Consumer(
//             builder: (context, ref, child) {
//               final String greet = ref.read(greetingsProvider);
//               return Text('hello $greet');
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

