import 'package:flutter/material.dart';
import 'package:spotify/Components/playlist.dart';

class Librarypage extends StatefulWidget {
  const Librarypage({super.key});

  @override
  State<Librarypage> createState() => _LibrarypageState();
}

class _LibrarypageState extends State<Librarypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 50,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
              fontWeight: FontWeight.bold),
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
          actions: [
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  size: 35,
                )),
            TextButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                size: 35,
              ),
            )
          ],
          title: Text("Sua Biblioteca")),
      body: Column(
        children: [],
      ),
    );
  }
}
