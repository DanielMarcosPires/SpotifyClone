import 'package:flutter/material.dart';

class ShortsVideo extends StatefulWidget {
  final List<Widget> children;

  const ShortsVideo({super.key, required this.children});

  @override
  State<ShortsVideo> createState() => _ShortsVideoState();
}

class _ShortsVideoState extends State<ShortsVideo> {
  Widget containsShorts(List<Widget> children) {
    if (children.isEmpty) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Número de colunas (pode ser ajustado)
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 180),
        itemCount: 3,
        // Número de quadrados
        itemBuilder: (BuildContext context, int index) {
          int indexAcc = index + 1;
          return Container(
            decoration: BoxDecoration(
                color: Colors.yellowAccent, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text('Shorts $indexAcc',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          );
        },
      );
    }
    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descubra algo novo pra você",
            style: TextStyle(fontSize: 24),
          ),
          containsShorts(widget.children),
        ],
      ),
    );
  }
}
