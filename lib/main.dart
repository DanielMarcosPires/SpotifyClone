import 'package:flutter/material.dart';
import 'package:spotify/layout/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            surface: Colors.black,
            primary: Colors.white,
            secondaryContainer: Colors.green,
            brightness: Brightness.dark,
            contrastLevel: 0.0),
        useMaterial3: true,
      ),
      home: Layout(),
    );
  }
}
