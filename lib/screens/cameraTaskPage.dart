import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:habit_app_front/repository/user_repository.dart';
import 'package:habit_app_front/widgets/proof/task_popup.dart';

import '../repository/task_repository.dart';
import '../widgets/pop_up/hero_dialog_route.dart';

class CameraTaskPage extends StatefulWidget {
  const CameraTaskPage({Key? key}) : super(key: key);

  @override
  State<CameraTaskPage> createState() => _CameraTaskPageState();
}

class _CameraTaskPageState extends State<CameraTaskPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
  File? img;
  
  _loadimage() async {
    cameraController.takePicture().then((XFile? file) async {
      if (mounted) {
        if (file != null) {
          // print("Picture saved to ${file.path}");
          setState(() {
           img =File(file.path);
          });
          print("Before img");
           Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                                return ProofPopupCard(img: img);
                              }));
          print("after img");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Stack(
        children: [
          Positioned.fill(child: CameraPreview(cameraController)),
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: Icon(Icons.settings),
                actions: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              body: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      bottom: 20,
                      right: 40,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: ClipRRect(
                              child: Image.network(
                                  "https://mario.wiki.gallery/images/8/84/MPS_Donkey_Kong_Artwork.png"),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _loadimage();
                            },
                            child: Container(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                              ),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                                border: Border.all(
                                  width: 10,
                                  color: Colors.white.withOpacity(.5),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Icon(
                              Icons.cached,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Icon(
                              Icons.tag_faces,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
