import 'dart:ffi';

import 'package:asana/constants/homepage.dart';
import 'package:asana/screens/about_screen.dart';
import 'package:asana/screens/contact_screen.dart';
import 'package:asana/screens/learn_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  late PageController pageController;

 

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 229,229,229),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: BottomNavigationBar(
              iconSize: 40,
              backgroundColor: Colors.red,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _page == 0 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.info,
                    color: _page == 1 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.book,
                    color: _page == 2 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mail,
                    color: _page == 3 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor,
                ),
              ],
              onTap: navigationTapped,
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            AboutScreen(),
            LearnScreen(),
            ContactScreen(),

          ],
        ),
      ),
    );
  }
}
