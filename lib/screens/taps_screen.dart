import 'package:app_noti/screens/tap1_screen.dart';
import 'package:app_noti/screens/tap2_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapsScreen extends StatelessWidget {
  const TapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Screen(),
      bottomNavigationBar: _Nav(),
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: provider.paginaActual,
      onTap: (value) => provider.paginaActual = value,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'para tí'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Encabezado'),
      ],
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavegacionModel>(context);
    return PageView(
      controller: provider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tap1Screen(),
        Tap2Screen(),
      ],
    );
  }
}

class NavegacionModel extends ChangeNotifier {
  int _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int value) {
    _paginaActual = value;

    _pageController.animateToPage(
      value,
      curve: Curves.bounceIn,
      duration: const Duration(milliseconds: 250),
    );

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
