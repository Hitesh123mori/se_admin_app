import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';
import 'dart:typed_data';

import 'package:se_admin_app/models/ImageModel.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/image_frame.dart';
import 'package:se_admin_app/main.dart';

class ImageDropZone extends StatefulWidget {
  List<ImageModel> imgFiles = [];
  dynamic provider;
  ImageDropZone({super.key, required this.imgFiles, required this.provider});

  @override
  _ImageDropZoneState createState() => _ImageDropZoneState();
}

class _ImageDropZoneState extends State<ImageDropZone> {
  late DropzoneViewController controller;
  bool isFileInZone = false;
  List<String> allowedFileType = ['.png', '.jpg', '.jpeg', '.gif'];
  // List<String> allowedFileType = ['.gif'];

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: DottedBorder(
            color: AppColors.theme["secondaryColor"],
            strokeWidth: 3,
            radius: const Radius.circular(100),
            dashPattern: const [10, 10],
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(child: Text("Drop your images here.", style: TextStyle(color:  AppColors.theme["secondaryColor"],),),),
                Container(
                  color: isFileInZone? Colors.grey: Colors.transparent,
                  width: mq.width,
                  height: 200,
                  child:DropzoneView(
                    onCreated: (controller) => this.controller = controller,
                    onDrop: (file) async {
                      // Handle the dropped file

                      String fileExtension = file.name.split('.').last.toLowerCase();
                      if(allowedFileType.contains('.$fileExtension')) {
                        ImageModel? imageModel = await widget.provider.current?.uploadImage(await controller.getFileData(file), widget.provider);
                        if(imageModel != null){
                          widget.imgFiles.add(ImageModel());
                        }
                        print("#file: $file ${file.name}");
                      }
                      setState(() {
                        isFileInZone = false;
                      });
                    },

                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onHover: () {
                      isFileInZone = true;
                      print('File is over the drop zone!');
                      setState(() {});
                    },
                    onLeave: () {
                      isFileInZone = false;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.imgFiles.isNotEmpty)
          CarouselSlider.builder(
            itemCount: widget.imgFiles.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                ImageFrame(imageModel: widget.imgFiles[itemIndex], provider: widget.provider),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: widget.imgFiles.length != 1,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 0,
            ),
          ),
      ],
    );
  }
}