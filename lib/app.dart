import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const Scaffold(
          body: Center(
            child: Text('Dog app'),
          ),
        );
      },
    );
  }
}
