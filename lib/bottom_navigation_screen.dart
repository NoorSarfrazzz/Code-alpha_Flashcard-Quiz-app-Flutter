import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'appbar_screen.dart';
import 'explore_screen.dart';
import 'flashcard_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    FlashcardScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 65,
            color: Colors.black.withOpacity(0.6),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined, color: Colors.white),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_membership_outlined, color: Colors.white),
                label: 'My Flashcards',
              ),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: Color(0xFF142A70),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            onTap: _onItemTapped,
            selectedIconTheme: IconThemeData(
              color: Colors.white,
              size: 32.0, // Increase size of selected icon
            ),
            unselectedIconTheme: IconThemeData(
              size: 24.0,
              color: Colors.grey.shade600, // Color of unselected icon
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left:
                MediaQuery.of(context).size.width / 2 - 0.5, // Center the line
            child: Container(
              width: 1.5, // Width of the separator line
              color: Colors.white, // Color of the separator line
            ),
          ),
        ],
      ),
    );
  }
}
