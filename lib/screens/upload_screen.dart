// import 'dart:html';

import 'dart:convert';

import 'package:asana/screens/result_screen.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../constants/homepage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'package:http/http.dart' as http;

Map<String?, String?> poseMap = {
  'padmasana' :'Padmasana'
};

class UploadScreen extends StatefulWidget {
  UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _video;
  bool loaded = false;
  late VideoPlayerController _controller;
  String? poseName = 'Undefined';

  Future<void> loadVideo() async {
    if (_video == null) return;
    _controller = VideoPlayerController.file(_video!);
    await _controller.initialize();
    setState(() {});
  }

  Future<void> pickVideo(int imageSource) async {
    final pickedFile = await ImagePicker().pickVideo(
        source: imageSource == 0 ? ImageSource.gallery : ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
      });
      await loadVideo();
      loaded = true;
      _controller.play();
      _controller.addListener(() {
        if (_controller.value.position == _controller.value.duration) {
          _controller.seekTo(Duration.zero);
          // _controller.play();
        }
      });
    }
  }

  Future<void> uploadVideo() async {
    if (_video == null) {
      print('Null video');
      return;
    }

    final url = Uri.parse('http://20.211.143.82/video');
    final request = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', _video!.path);
    // request.fields['Content-Type'] = 'multipart/form-data';
    // request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(Uri.parse(_video!.path)).readAsBytes(), contentType: new MediaType('image', 'jpeg')));
    request.files.add(file);

    try {
      final response = await request.send().timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        // Success
        print('success');
        String? pose =  await response.stream.bytesToString();
         var poseJson = json.decode(pose);
         print(poseJson);
      } else {
        // Error
        print('Effort failed');
        print(response.stream.bytesToString());
      }
    } catch (e) {
      String? pose = '{"Pose":"padmasana"}';
      var poseJson = json.decode(pose);
      poseName = poseJson['Pose'];
      print('Error: $e hahaha');
    } finally {
      //push a new page based on the pose returned, but for now, a padmasana will do
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(poseName: poseMap[poseName],)));
    }

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      'Upload',
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Choose a video file to upload',
                              style: kHomeTextStyle.copyWith(
                                fontSize: 20,
                                color: primaryColor,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                pickVideo(0);
                              },
                              child: Text('Select video'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                pickVideo(1);
                              },
                              child: Text('Record'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            loaded
                                ? AspectRatio(
                                    aspectRatio: 0.6,
                                    child: VideoPlayer(_controller))
                                : Text('Inshallah'),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 200,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: uploadVideo,
                                child: Text(
                                  'Predict',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        // width: 300,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
