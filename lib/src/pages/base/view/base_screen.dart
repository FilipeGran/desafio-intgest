// ignore_for_file: prefer_final_fields, unused_field, must_be_immutable, use_build_context_synchronously

import 'package:desafio_intgest/src/pages/authentication/controller/auth_controller.dart';
import 'package:desafio_intgest/src/pages/home/home_screen.dart';
import 'package:desafio_intgest/src/pages/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

class BaseScren extends StatefulWidget {
  const BaseScren({super.key});

  @override
  State<BaseScren> createState() => _BaseScrenState();
}

class _BaseScrenState extends State<BaseScren> {
  final PageController _pageController = PageController();
  final authController = AuthController();

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentPageIndex) {
        setState(() {
          _currentPageIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          if (index != _currentPageIndex) {
            setState(() {
              _currentPageIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              );
            });
          }
        },
      ),
    );
  }
}
