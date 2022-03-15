import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_instagram/widget_catalogs/glassmorphism_widget.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  static const String id = 'upload_page';
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TextEditingController captionController = TextEditingController();

  bool isUpload = false;
  File? image;


  Future pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        if (kDebugMode) {
          print("Hello path => $imageTemporary");
        }

        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  Future takeImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        if (kDebugMode) {
          print("Hello path => $imageTemporary");
        }

        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload", style: TextStyle(fontFamily: 'Billabong'),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add_photo_alternate, color: Colors.red.shade400,),
            onPressed: (){},
            splashRadius: 10,
            padding: const EdgeInsets.only(right: 8),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // #image upload
            GestureDetector(
              onTap: (){
                pickImage();
                setState(() {
                  isUpload = true;
                });
              },
              child: Stack(
                children: [

                  // #upload image
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade600,
                    child: isUpload && image != null
                        ? Image.file(image!, fit: BoxFit.cover,)
                        : const Icon(Icons.add_a_photo_rounded),
                  ),

                  // #iconButton
                  Positioned(
                    top: 15,
                    right: 15,
                    child: GlassMorphism(
                      start: 0.3,
                      end: 0.3,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black, size: 20,),
                        onPressed: (){},
                        padding: EdgeInsets.zero,
                        splashRadius: 20,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // #caption textFields
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                cursorColor: Colors.black,
                controller: captionController,
                keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: null,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Caption',
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black38)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
