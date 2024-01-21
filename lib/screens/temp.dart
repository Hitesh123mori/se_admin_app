import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:typed_data';

class MyDropzoneView extends StatefulWidget {
  @override
  _MyDropzoneViewState createState() => _MyDropzoneViewState();
}

class _MyDropzoneViewState extends State<MyDropzoneView> {
  late DropzoneViewController controller;
  List<Uint8List> bytes = [];
  List<String> allowedFileType = ['.png', '.jpg', '.jpeg', '.gif'];
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          if (bytes.isNotEmpty)
            Container(
              color: Colors.red,
              child: CarouselSlider.builder(
                itemCount: bytes.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.memory(bytes[itemIndex]),
                options: CarouselOptions(
                  autoPlay: bytes.length != 1,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 2.0,
                  initialPage: 0,
                ),
              ),
            ),



          Expanded(
            child: Container(
              // color: Colors.yellow,
              child:DropzoneView(
                onCreated: (controller) => this.controller = controller,
                onDrop: (file) async {
                  // Handle the dropped file
            
                  String fileExtension = file.name.split('.').last.toLowerCase();
                  if(allowedFileType.contains('.$fileExtension')) {
                    bytes.add(await controller.getFileData(file));print("#file: $file ${file.name}");
                  }
                  setState(() {
                  });
                },
            
                operation: DragOperation.copy,
                cursor: CursorType.grab,
                onHover: () => print('File is over the drop zone!'),
              ),
            ),
          ),



        ],
      ),
    );
  }
}