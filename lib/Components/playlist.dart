import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  final String src;
  final String title;
  final double size;

  const Playlist(
      {super.key, required this.src, required this.title, required this.size});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.surfaceContainer,
          ),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: WidgetStatePropertyAll(EdgeInsets.all(0)),

      ),
      child: Row(
        spacing: 1,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/$src.jpg",
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          // Adiciona espaçamento entre a imagem e o texto
          Expanded(
            // Evita que o texto estoure o Card
            child: Text(
              title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
