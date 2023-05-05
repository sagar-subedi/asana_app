import 'package:flutter/material.dart';
import 'package:asana/constants/homepage.dart';

Map<String?,String?> poseInfoTextMap = {'Padmasana' :'''Padmasana, also known as Lotus Pose, is a seated meditation posture in yoga. It is considered to be a stable and comfortable position for long periods of meditation, and is therefore commonly used in yoga and mindfulness practices. The posture involves crossing the legs and placing the feet on opposite thighs, with the hands resting on the knees in a mudra, or symbolic gesture. Padmasana is said to help promote physical stability, mental clarity, and spiritual enlightenment. It is typically performed in a quiet, relaxed atmosphere and is considered a symbol of purity, peace, and spiritual awakening in yoga and Hindu culture.

Benifits :
Improved posture: Padmasana helps to improve posture by strengthening the spine and aligning the hips, knees, and ankles.
Reduced stress and anxiety: By promoting relaxation and calming the mind, Padmasana can help to reduce stress and anxiety.
Increased flexibility: Practicing Padmasana can help to increase flexibility in the hips, knees, and ankles, which can in turn improve overall mobility and balance.
Improved blood circulation: By stretching and massaging the legs and hips, Padmasana can improve blood circulation, reducing the risk of varicose veins and other circulatory problems.
Better digestion: Padmasana can also help to improve digestive function by massaging the abdominal organs and promoting the release of digestive juices.
Increased focus and concentration: By promoting stillness and relaxation, Padmasana can help to increase focus and concentration, making it a useful pose for meditation and mindfulness practices.
Improved mental clarity: By calming the mind and promoting relaxation, Padmasana can help to improve mental clarity and reduce mental fatigue.
It is important to note that while Padmasana can provide these benefits, it is also important to practice it safely and to listen to your body, especially if you have any physical limitations or injuries.

Steps : 
Start in a seated position with your legs extended straight out in front of you and your hands resting on your knees.
Bend your right knee and place the sole of your right foot on your left thigh, with the heel close to your hip.
Bend your left knee and place the sole of your left foot on your right thigh, with the heel close to your hip.
Bring your hands to your knees or place them in your lap, in a mudra of your choice.
Keep your spine straight and relax your shoulders.
Close your eyes and focus on your breath, trying to keep your mind calm and relaxed.
Hold the pose for as long as is comfortable, typically anywhere from 5 to 10 minutes.
To release the pose, gently remove your feet from your thighs and straighten your legs, then return to a seated position with your legs extended straight out in front of you.'''};

//PoseTexts, an array of texts
List<Text> poseInfoTextArr = [
  Text('')
];

class PoseScreen extends StatelessWidget {
  late  String? poseName;
   PoseScreen({Key? key, required this.poseName}) : super(key: key);

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
                    '${poseName}',
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical:20, horizontal: 5),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    color: Colors.white,
                    child: Text(poseInfoTextMap[poseName]!,
                      style: kHomeTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),),
    );

  }
}


//need to create a class for the body of the learning page

