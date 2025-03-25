import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  final String src;
  final String title;
  final double size;
  final Color color; // Agora usa Color diretamente

  const Playlist({
    super.key,
    required this.src,
    required this.color,
    required this.title,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(_createRoute(title, src, color));
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

Route _createRoute(String titleRoute, String urlRoute, Color color) {
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Page2(
            title: titleRoute,
            url: urlRoute,
            color: color,
          ),
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

class Page2 extends StatelessWidget {
  final String title;
  final String url;
  final Color color;

  const Page2({
    super.key,
    required this.title,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: color,
        child: Icon(Icons.arrow_back_outlined,color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400 / 1.4,
                  height: 400 / 1.4,
                  child: Card(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          url,
                          width: 400 / 1.5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20 * 2, 10, 0, 0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
