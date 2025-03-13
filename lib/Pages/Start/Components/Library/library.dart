import 'package:flutter/material.dart';

import '../../../../Components/playlist.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Playlist(
          src: 'orquestra',
          title: 'Hinos Orquestrados',
        ),
        Playlist(
          src: 'orquestraSacra',
          title: 'Orquestra Sacros Cordas e Corne Inglês',
        ),
        Playlist(src: "bibliaFalada", title: "Biblia Falada"),
        Playlist(
          src: 'orquestra',
          title: 'Hinos Orquestrados',
        ),
        Playlist(
          src: 'orquestraSacra',
          title: 'Orquestra Sacros Cordas e Corne Inglês',
        ),
        Playlist(src: "bibliaFalada", title: "Biblia Falada"),
      ],
    );
  }
}
