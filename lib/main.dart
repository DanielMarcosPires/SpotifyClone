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
            surface: Colors.black12,
            primary: Colors.white,
            secondaryContainer: Colors.green.shade600,
            brightness: Brightness.dark,
            contrastLevel: 1
        ),

        useMaterial3: true,
      ),
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Layout(),
      ),
    );
  }
}
