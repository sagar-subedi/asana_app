import 'package:asana/screens/record_screen.dart';
import 'package:asana/screens/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:asana/constants/homepage.dart';

import '../constants/homepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return UploadScreen();
                            }));
                          },
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
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return RecordScreen();
                            }),);
                          },
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
    );
  }
}


