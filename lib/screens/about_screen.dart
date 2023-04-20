import 'package:asana/constants/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackground,
      body: SafeArea(
        child: Column(children: [
          Container(

            padding: EdgeInsets.fromLTRB(100, 60, 0, 0),
            width: double.infinity,
            color: Colors.deepPurple[300],
            height: MediaQuery.of(context).size.height / 5,
            child: Text(
              'About Us',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w900,
                color: Colors.grey[300],
              ),
            ),
          ),
          Expanded( child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    'Developer Team',
                    style: kHomeTextStyle.copyWith(
                      color:  primaryColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileCard(
                      name: 'SAGAR SUBEDI',
                      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    ),
                    ProfileCard(
                      name: 'BIBEK CHALISE',
                      imageUrl: 'https://i.pinimg.com/originals/59/90/54/599054ecc6c14fd3409ed702bb7f8ae0.jpg',
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ProfileCard(
                      name: 'SULABH GHIMIRE',
                      imageUrl: 'https://m.media-amazon.com/images/I/61TYO+V7wQL._AC_SX569_.jpg',
                    ),
                    ProfileCard(
                      name: 'SUSHIL POUDEL',
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPY0rjoJf3hshIVodFaQD4CYQhxaEwCaf_KQ&usqp=CAU',
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Text(
                    'Special Thanks',
                    style: kHomeTextStyle.copyWith(
                      color:  primaryColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileCard(name: 'RAMESH THAPA', imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Anjem_Choudary_hires.jpg/220px-Anjem_Choudary_hires.jpg'),
                  ],
                ),

              ],
            ),
          ),
        ]),
      ),
    );
  }
}


class ProfileCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProfileCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

