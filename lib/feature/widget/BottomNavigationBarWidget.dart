import 'package:examproject2/feature/homescreen/HomeScreen.dart';
import 'package:examproject2/feature/settings/SettingsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/consts/AppColors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('More Page')),
    const Center(child: Text('Search Page')),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(CupertinoIcons.home, 0, ),
            _buildNavItem(CupertinoIcons.search, 1, ),
            _buildNavItem(CupertinoIcons.bookmark, 2, ),
            _buildNavItem(CupertinoIcons.settings, 3, ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index,) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              icon,
              size: 24,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w100,
              color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
