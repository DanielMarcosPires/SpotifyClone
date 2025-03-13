import 'package:flutter/material.dart';

class ScrollingCatalog extends StatefulWidget {
  final String title;
  const ScrollingCatalog({super.key, required this.title});

  @override
  State<ScrollingCatalog> createState() => _ScrollingCatalogState();
}

class _ScrollingCatalogState extends State<ScrollingCatalog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,12,8,12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    margin: EdgeInsets.all(10),
                    color: Colors.amber,
                    child: Center(child: Text('Item $index'))
                  );
                }
              ),
          ),
        ],
      ),
    );
  }
}
