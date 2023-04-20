import 'package:asana/constants/homepage.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key}) : super(key: key);

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
                  'Learn',
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
          Expanded(
            child: ListView(
              children: [
                const PoseCard(

                ),
              ],
            ),
          )
        ],
      ),),
    );
    ;
  }
}

class PoseCard extends StatelessWidget {
  const PoseCard({Key? key}) : super(key: key);
  final String? title = 'INSHALLAH';
  final String? subtitle = 'Boys Played Well';
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image on the left side
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title and subtitle on the right side
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${title}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
              ExpandableText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquam gravida purus, sed feugiat mauris porttitor at. Sed ac lacinia nulla, eget vestibulum lacus. Sed in dolor et mauris aliquet consequat. Integer vel commodo urna. Duis at nisl vel urna efficitur commodo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sit amet enim nunc. Nam accumsan leo eget bibendum malesuada. Aliquam et facilisis mi. Quisque at urna non leo interdum bibendum. Morbi commodo ex non venenatis mollis. Pellentesque a mi at enim laoreet consectetur.',
                expandText: 'See more',
                collapseText: 'See less',
                maxLines: 2,
                linkColor: Colors.blue,
                onUrlTap: (e){},
              ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
