import 'dart:ffi';

import 'package:asana/screens/pose_screen.dart';
import 'package:flutter/material.dart';

import '../constants/homepage.dart';

class ResultScreen extends StatelessWidget {
  late String? poseName;
  ResultScreen({Key? key, required this.poseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackground,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: primaryColor,
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                ),
                Positioned(
                  right: 30,
                  bottom: 15,
                  child: Text(
                    'Output',
                    style: kHomeTextStyle.copyWith(
                      fontSize: 60,
                      color: greyBackground,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //image
      Image.network(
        'https://via.placeholder.com/350', //assetImages/${poseName}.jpg
      ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PoseScreen(poseName: '${poseName}')));
              },
              child: Container(
                color: primaryColor,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                margin: EdgeInsets.symmetric(vertical: 30,
                horizontal: 20),
                child: Text('${poseName}',
                  textAlign: TextAlign.center,
                  style: kHomeTextStyle.copyWith(
                    color: greyBackground,
                  ),),
              ),
            ),
            //text
          ],
        ),),
    );
  }
}
