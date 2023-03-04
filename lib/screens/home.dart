import 'dart:ffi';

import 'package:asana/constants/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  Color? primaryColor = Colors.deepPurple[300];

  Color? secondaryColor = Colors.black;

  void navigationTapped(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(150, 50, 0, 0),
                width: double.infinity,
                color: Colors.deepPurple[300],
                child: Text(
                  'Asana',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Expanded(child: Container(
                          color: Colors.purple,
                          child: SvgPicture.asset('assets/images/yoga.svg',
                            color: Colors.white,
                            fit: BoxFit.fill,
                          ),
                        ),),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AI',
                                  style: kHomeTextStyle.copyWith(
                                    fontSize: 50,
                                    color: primaryColor,
                                  ),
                                ),
                                Text(
                                  'Powered Yoga Pose Classifier',
                                  style: kHomeTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20,15,20,5),
                            height: 80,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              style: kHomeButtonStyle,
                              child: Text('Upload',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20,5,20,15),
                            height: 80,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              style: kHomeButtonStyle,
                              child: Text('Record',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),),
                            ),
                          )
                        ],
                      )
                ],),

              ),
            ),

          ],
        ),
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
      ),
    );
  }
}
