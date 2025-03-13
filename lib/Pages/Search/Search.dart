import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            leadingWidth: 50,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
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
                    Icons.camera_alt_outlined,
                    size: 40,
                  ))
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(75),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "O que você quer ouvir?",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.search, color: Colors.black45),
                      filled: true),
                  style: TextStyle(color: Colors.black),
                )),
            title: Text("Buscar")));
  }
}
