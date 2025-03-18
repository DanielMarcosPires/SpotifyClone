import 'dart:math';
import 'package:flutter/material.dart';

class Catalogy extends StatefulWidget {
  const Catalogy({super.key});

  @override
  State<Catalogy> createState() => _CatalogyState();
}

class _CatalogyState extends State<Catalogy> {
  // Função para gerar uma cor aleatória
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Opacidade fixa
      random.nextInt(180), // Vermelho
      random.nextInt(180), // Verde
      random.nextInt(180), // Azul
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Navegar por todas as seções",style: TextStyle(fontSize: 24),),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de colunas
            crossAxisSpacing: 8, // Espaçamento horizontal
            mainAxisSpacing: 12, // Espaçamento vertical
            childAspectRatio: 1.5, // Ajusta a proporção do item
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              onPressed: (){},
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                backgroundColor: WidgetStatePropertyAll(getRandomColor()),
              ),
              child: Text(
                "Seção $index",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
