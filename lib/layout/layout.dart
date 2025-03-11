import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/Pages/start.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: <Widget>[Start(), Text("oi")][currentPageIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            const NavigationDestination(
                selectedIcon: Icon(Icons.home_filled),
                icon: Icon(Icons.home_outlined),
                label: "Início"),
            const NavigationDestination(
                icon: Icon(Icons.search), label: "Buscar"),
            const NavigationDestination(
                icon: Icon(Icons.library_music), label: "Sua Biblioteca"),
            const NavigationDestination(icon: Icon(Icons.add), label: "Criar"),
          ]),
    );
  }
}
