import 'package:flutter/material.dart';

import '../../second_page.dart';

class ScrollingCatalog extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> playlists;

  const ScrollingCatalog(
      {super.key, required this.title, required this.playlists});

  @override
  State<ScrollingCatalog> createState() => _ScrollingCatalogState();
}

class _ScrollingCatalogState extends State<ScrollingCatalog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.playlists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final playlist = widget.playlists[index];
                      if (widget.playlists.isEmpty) {
                        return Container(
                          width: 400,
                          margin: EdgeInsets.all(9),
                          color: Colors.redAccent,
                          child: Center(child: Text('Sem Playlists')),
                        );
                      } else {
                        return TextButton(
                            onPressed: () {
                              Navigator.of(context).push(_createRoute(
                                playlist['title'] ?? "",
                                playlist['src'] ?? "",
                                Color(playlist['color'] ??
                                    0xFFFFFFFF), // Certifica que é uma cor válida
                              ));
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            child: Column(
                              children: [
                                Center(
                                    child: Image.network(
                                  playlist['src'] ?? "",
                                  width: 150,
                                  fit: BoxFit.cover,
                                )),
                                Text(
                                  playlist['title'] ?? "",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white24),
                                )
                              ],
                            ));
                      }
                    })),
          ],
        ));
  }
}

Route _createRoute(String titleRoute, String urlRoute, Color color) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, color],
              // Cores do gradiente
              begin: Alignment.bottomCenter,
              // Início do gradiente
              end: Alignment.topCenter,
              // Fim do gradiente
              stops: const [0.5, 1.0]),
        ),
        child: SecondPage(
          title: titleRoute,
          url: urlRoute,
          color: color,
          playlistName: '',
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

// class Page2 extends StatelessWidget {
//   final String title;
//   final String url;
//   final String color;
//
//   const Page2(
//       {super.key, required this.title, required this.url, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         backgroundColor: Color(int.parse(color)),
//         child: Icon(Icons.arrow_back_outlined),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 400 / 1.4, // Garante que o fundo cubra toda a largura
//                   height: 400 / 1.4, // Garante que o fundo cubra toda a altura
//                   child: Card(
//                     child: Center(
//                       // Centraliza a imagem no meio da tela
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(
//                           url,
//                           width: 400 / 1.5, // Ajusta o tamanho da imagem
//                           fit: BoxFit.contain, // Evita cortes na imagem
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20*2,10,0,0),
//             child: Row(
//               children: [
//                 Text(
//                   "Orquestra Sacra",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize:
//                           Theme.of(context).textTheme.headlineMedium?.fontSize),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
