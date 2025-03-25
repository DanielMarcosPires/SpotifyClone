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
          src: 'https://i.scdn.co/image/ab67616d00001e02cda417ffee03a3a25da96416',
          title: 'Hinos Orquestrados',
          size: 90,
          color: Color(0xFFFF5722), // #ff5722
        ),
        Playlist(
          size: 90,
          src: 'https://i.scdn.co/image/ab67616d00001e02e4c29ad07c6b3780497ba406',
          title: 'Welcome to Crocodile Isle',
          color: Color(0xFF82B1FF), // #82b1ff
        ),
        Playlist(
          size: 90,
          src: "https://i.scdn.co/image/ab67616d00001e028d24bc081fd83fcbe59ac9c9",
          title: "Klomp's Romp",
          color: Color(0xFF00E60B), // #00e676
        ),
        Playlist(
          size: 90,
          src: 'https://i.scdn.co/image/ab67616d00001e02d6153f0115ff0253f6259667',
          title: 'Forest Interlude (DK2)',
          color: Color(0xFF2C5AF1), // #29b6f6
        ),
        Playlist(
          size: 90,
          src: 'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da846d9f25a9609643e78fb7574f',
          title: 'Bíblia Falada',
          color: Color(0xFFD7CCC8), // #d7ccc8
        ),
        Playlist(
          size: 90,
          src: "https://i.scdn.co/image/ab67616d00001e0218c1ec96f320081711983799",
          title: "Orquestra Sacra",
          color: Color(0xFF2511EE), // #2511ee (Corrigi o último valor inválido: #ff2511e → #2511ee)
        ),
      ],


    );
  }
}
