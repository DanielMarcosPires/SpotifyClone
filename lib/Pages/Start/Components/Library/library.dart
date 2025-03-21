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
          mainAxisExtent: 80),
      shrinkWrap: true,
      children: [
        Playlist(
          src:
              'https://i.scdn.co/image/ab67616d00001e02cda417ffee03a3a25da96416',
          title: 'Hinos Orquestrados',
          size: 90,
        ),
        Playlist(
          size: 90,
          src:
              'https://i.scdn.co/image/ab67616d00001e02e4c29ad07c6b3780497ba406',
          title: 'Welcome to Crocodile Isle',
        ),
        Playlist(
            size: 90,
            src:
                "https://i.scdn.co/image/ab67616d00001e028d24bc081fd83fcbe59ac9c9",
            title: "Klomp's Romp"),
        Playlist(
          size: 90,
          src:
              'https://i.scdn.co/image/ab67616d00001e02d6153f0115ff0253f6259667',
          title: 'Forest Interlude (DK2)',
        ),
        Playlist(
          size: 90,
          src:
              'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da846d9f25a9609643e78fb7574f',
          title: 'Bíblia Falada',
        ),
        Playlist(
            size: 90,
            src:
                "https://i.scdn.co/image/ab67616d00001e0218c1ec96f320081711983799",
            title: "Orquestra Sacra"),
      ],
    );
  }
}
