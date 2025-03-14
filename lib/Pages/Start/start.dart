import 'package:flutter/material.dart';
import 'package:spotify/Components/playlist.dart';
import 'package:spotify/Pages/Start/Components/Library/library.dart';
import 'package:spotify/Pages/Start/Components/ScrollingCatalog/scrolling-catalog.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  String dropdownValue = 'Tudo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 50,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.black,
          leading: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Define a cor de fundo
              shape: BoxShape.circle, // Transforma o container em um círculo
            ),
            child: Text(
              "D",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          title: SegmentedButton(
              showSelectedIcon: false,
              style: SegmentedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                side: BorderSide(style: BorderStyle.none),
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                selectedForegroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              segments: <ButtonSegment<String>>[
                ButtonSegment<String>(
                  label: Text("Tudo"),
                  value: "Tudo",
                ),
                ButtonSegment<String>(
                  label: Text("Música"),
                  value: "Música",
                ),
                ButtonSegment<String>(
                  label: Text("Podcasts"),
                  value: "Podcasts",
                )
              ],
              selected: <String>{dropdownValue},
              onSelectionChanged: (Set<String> newValue) {
                setState(() {
                  dropdownValue = newValue.first;
                });
              })),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Library(),
                ScrollingCatalog(
                  title: 'Recomendado para hoje',
                ),
                ScrollingCatalog(
                  title: 'Descoberta para você',
                ),
                ScrollingCatalog(
                  title: 'Recentes',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
