import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String title;
  final String url;
  final String playlistName;
  final Color color;

  const SecondPage({
    super.key,
    required this.title,
    required this.url,
    required this.playlistName,
    required this.color,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isPlaying = false; // Mover a variável para fora do build()
  double _currentSliderValue = 0;

  String formatDuration(double seconds) {
    int minutes =
        (seconds ~/ 60); // Divide os segundos por 60 para obter os minutos
    int remainingSeconds =
        (seconds % 60).toInt(); // Obtém os segundos restantes
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}'; // Garante que tenha dois dígitos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: widget.color,
        child: Icon(Icons.arrow_back_outlined, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20 * 2, 35, 20 * 2, 0),
        child: Column(
          spacing: 3,
          children: [
            Row(
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
                          widget.url,
                          width: 400 / 1.5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.fontSize,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.url,
                      width: 400 / 8,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 4),
                  // Adiciona um espaçamento entre a imagem e o texto
                  Text(widget.playlistName, style: TextStyle(fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Text("Album * 25 jun 2025",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white38,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.surfaceDim,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 25 * 2.3,
                      height: 25 * 2.3,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isPlaying =
                                !isPlaying; // Alterna entre play e pause
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1DB954),
                          padding: EdgeInsets
                              .zero, // Remove o padding interno do botão
                        ),
                        child: Center(
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 25 * 1.5,
                            color: Colors.black,
                          ),
                        ), // Alterna entre os ícones
                      ),
                    ),
                    Row(
                      children: [
                        Slider(
                            value: _currentSliderValue,
                            onChanged: (value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                            activeColor: Color(0xFF1DB954)),
                        Text(formatDuration(_currentSliderValue),
                            style: TextStyle(fontSize: 18))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
