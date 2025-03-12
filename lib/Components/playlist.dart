import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  final String src;
  final String title;
  const Playlist({super.key, required this.src, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 195,
        child: Card(
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            // Adiciona um pequeno padding interno
            child: Row(
              children: [
                Image.asset(
                  "assets/images/$src.jpg",
                  width: 80,
                  height: 80,
                  // Adiciona altura para manter a proporção
                  fit: BoxFit.cover,

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
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
