import 'package:aust_track/bus_page.dart';
import 'package:aust_track/home_screen.dart';
import 'package:aust_track/lost_found_screen.dart';
import 'package:aust_track/missing_notes_page.dart';
import 'package:aust_track/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    BusPage(),
    MissingNotesPage(),
    QrScreen(),
    LostFoundPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),

      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

        child: GNav(
          selectedIndex: _currentIndex,

          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          rippleColor: Colors.grey.shade300,
          hoverColor: Colors.grey.shade200,
          haptic: true,

          tabBorderRadius: 20,
          gap: 8,

          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 400),

          color: Colors.grey,
          activeColor: const Color(0xff407362),

          iconSize: 24,

          tabBackgroundColor: const Color(0xff407362).withValues(alpha: 0.1),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.directions_bus,
              text: 'Bus',
            ),
            GButton(
              icon: Icons.note_alt_sharp,
              text: 'Notes',
            ),
            GButton(
              icon: Icons.qr_code,
              text: 'QR',
            ),
            GButton(
              icon: Icons.inventory,
              text: 'Lost & Found',
            ),
          ],
        ),
      ),
    );
  }
}