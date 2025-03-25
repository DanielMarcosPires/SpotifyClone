import 'package:flutter/material.dart';

import '../Pages/Start/second_page.dart';

class Playlist extends StatelessWidget {
  final String src;
  final String title;
  final double size;
  final String playlistName;
  final Color color; // Agora usa Color diretamente

  const Playlist({
    super.key,
    required this.src,
    required this.color,
    required this.title,
    required this.playlistName,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(_createRoute(title, src,playlistName, color));
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.surfaceContainer,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              src,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8), // Adiciona espaçamento entre a imagem e o texto
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

Route _createRoute(String titleRoute, String urlRoute,String playlistName, Color color) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, color], // Agora usa a cor corretamente
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.5, 1.0],
          ),
        ),
        child:SecondPage(
          title: titleRoute,
          url: urlRoute,
          playlistName: playlistName,
          color: color,
        ),
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
