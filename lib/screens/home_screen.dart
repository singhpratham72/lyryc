import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LYRYC'),
        backgroundColor: Theme.of(context).accentColor,
        // TODO: Insert LYRYC Logo here
      ),
      body: Center(
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                      child: FloatingActionButton(
                        onPressed: () {
                          getImage();
                        },
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text('Upload a picture to generate lyrycal captions.'),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        Image.file(
                          _image!,
                          fit: BoxFit.contain,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _image = null;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).accentColor,
                            )),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0)),
                      onPressed: () {
                        print("Generate Captions");
                        // TODO: Push image to cloud, perform function and move to caption screen
                      },
                      child: Text(
                        'GENERATE',
                        style: TextStyle(fontSize: 18.0),
                      ))
                ],
              ),
      ),
    );
  }
}
