import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.music_note,size: 40.0,),
        actions: [
          TextButton(onPressed: (){}, child: Text("Tudo")),
          TextButton(onPressed: (){}, child: Text("Música")),
          TextButton(onPressed: (){}, child: Text("Podcasts")),
        ],
      ),
      body: Text("oiee"),
    );
  }
}
