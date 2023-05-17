import 'package:comic_app/features/chapter_screen/ui/chapter_screen.dart';
import 'package:comic_app/features/favor_screen/favor_screen.dart';
import 'package:comic_app/features/main_screen/ui/main_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _page = 1;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final tab = [
    const ChapterScreen(
      id: '',
      title: '',
    ),
    const MainScreen(),
    const FavoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 60.0,
          items: [
            // icon of navigation
            _buildIconNavigationBar(icon: Icons.person, index: 0),
            _buildIconNavigationBar(
                icon: Icons.keyboard_arrow_up_outlined, index: 1),
            _buildIconNavigationBar(icon: Icons.favorite, index: 2),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: const Color(0xff19A7CE),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: tab[_page]);
  }

  Widget _buildIconNavigationBar({required IconData icon, required int index}) {
    return Icon(icon, size: 30, color: const Color(0xff19A7CE));
  }
}
