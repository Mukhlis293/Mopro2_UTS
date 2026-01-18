import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/video_reels_page.dart';
import 'pages/daftar_saya_page.dart';
import 'pages/profile_saya_page.dart';

class MovieHomeShell extends StatefulWidget {
  const MovieHomeShell({super.key});

  @override
  State<MovieHomeShell> createState() => _MovieHomeShellState();
}

class _MovieHomeShellState extends State<MovieHomeShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MovieHomePage(),
    const VideoReelsPage(),
    const DaftarSayaPage(),
    const ProfileSayaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Jelajah'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), activeIcon: Icon(Icons.video_library), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.star_outline), activeIcon: Icon(Icons.star), label: 'Daftar Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.face_outlined), activeIcon: Icon(Icons.face), label: 'Saya'),
        ],
      ),
    );
  }
}