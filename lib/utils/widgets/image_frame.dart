import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:se_admin_app/models/ImageModel.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/main.dart';
class ImageFrame extends StatefulWidget {
  ImageModel imageModel;
  dynamic provider;
  ImageFrame({super.key, required this.imageModel, required this.provider});

  @override
  State<ImageFrame> createState() => _ImageFrameState();
}

class _ImageFrameState extends State<ImageFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mq.width,
      height: mq.height*0.7,
      color: AppColors.theme['tertiaryColor'],
      child: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(
              onPressed: () async {
                widget.imageModel.delete();
                setState(() {
                  Fluttertoast.showToast(
                    toastLength: Toast.LENGTH_LONG,
                    timeInSecForIosWeb: 5,
                    msg: "Image Deleted",
                    webShowClose: true,
                    webBgColor: "#14181a",
                    backgroundColor: Colors.black,
                    gravity: ToastGravity.BOTTOM_RIGHT,
                  );
                });
                widget.provider.notify();
              },
              icon: Icon(Icons.close_rounded)
            ),

            StreamBuilder<String>(
              stream: widget.imageModel.uri?.asStream(),
              builder: (context, snap) {
                if (snap.hasData){
                  return Image.network(
                    snap.data.toString(),
                    width: mq.width,
                    height: mq.height*0.65,
                    loadingBuilder:
                        (context, child, loadingProcess) {
                      if (loadingProcess == null) {
                        return child;
                      } else {
                        return  CircularProgressIndicator(color: AppColors.theme['highlightColor'],);
                      }
                    },
                  );
                }

                else if(snap.hasError){
                  return const Text("Error", style: TextStyle(color: Colors.white));
                }

                else return const CircularProgressIndicator();
              }
            )

          ],
        ),
      ),
    );
  }
}
