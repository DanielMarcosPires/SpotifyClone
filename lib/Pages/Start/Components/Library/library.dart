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
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 80
      ),
      shrinkWrap: true,
      children: [
        Playlist(
          src: 'orquestra',
          title: 'Hinos Orquestrados',
          size: 90,
        ),
        Playlist(
          size: 90,
          src: 'orquestraSacra',
          title: 'Orquestra Sacros Cordas e Corne Inglês',
        ),
        Playlist(size: 90, src: "bibliaFalada", title: "Biblia Falada"),
        Playlist(
          size: 90,
          src: 'orquestra',
          title: 'Hinos Orquestrados',
        ),
        Playlist(
          size: 90,
          src: 'orquestraSacra',
          title: 'Orquestra Sacros Cordas e Corne Inglês',
        ),
        Playlist(size: 90, src: "bibliaFalada", title: "Biblia Falada"),
      ],
    );
  }
}
