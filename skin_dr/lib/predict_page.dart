import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {

  late Future<File> imageFile;
  File? _image;
  String result = '';
  String confid = '';
  ImagePicker? imagePicker;

  getPhotoFromGallery() async{
    XFile? pickedFile = await imagePicker!.pickImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  getPhotoFromCamera() async{
    XFile? pickedFile = await imagePicker!.pickImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  loadModel()async{
    String? output = await Tflite.loadModel(
        model: 'assets/model/model_unquant.tflite',
        labels: 'assets/model/labels.txt',
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
    print(output);
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    loadModel();
  }

  doImageClassification()async {
    var recognition = await Tflite.runModelOnImage(
      path: _image!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.1,
      asynch: true
    );
    print(recognition!.length.toString());
    setState(() {
      result = '';
      confid = '';
    });
    recognition.forEach((element) {
      setState(() {
        print(element.toString());
        // can put if condition to show
        result += element['label'];
        confid += (element['confidence'] * 100).toString();
        print(result + ' - ' + confid+'%');
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    if (result == '0 mel'){
      result = 'Melanoma (mel)';
    }
    else if (result == '1 bkl') {
      result = 'Benign keratosis-like lesions (bkl)';
    } else{
      result = 'Melanocytic nevi (nv)';
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0),
      backgroundColor: const Color(0xFFfbfcff),
      body: Container(
        child: Column(
          children: [
           const SizedBox(
              width: 100.0,
            ),

            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30.0,
                        right: 35,
                        left: 10.0
                      ),
                      child: _image!=null
                      ?
                      Image.file(_image!,
                        height: 300.0,
                        width: 300.0,
                        fit: BoxFit.cover,
                      )
                          :
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.blue,
                            ),
                          )
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50.0,),
            Container(
              margin: const EdgeInsets.only(top: 20.0,),
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.blueAccent,

                ),
              ),
            ),

          ],
        )
      ),
      floatingActionButton: InkWell(
          splashColor: Colors.blue,
          onLongPress: () {
          print('on Long pressed');
          getPhotoFromCamera();
        },
        child: FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed:(){
              print('on pressed');
              getPhotoFromGallery();
            }
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'me',
          ),
        ],
      ),
    );
  }
}

