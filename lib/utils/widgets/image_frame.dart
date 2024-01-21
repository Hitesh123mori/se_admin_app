import 'package:flutter/material.dart';
import 'package:se_admin_app/models/ImageModel.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/main.dart';
class ImageFrame extends StatelessWidget {
  ImageModel imageModel;
  dynamic provider;
  ImageFrame({super.key, required this.imageModel, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mq.width,
      height: mq.height*0.7,
      color: AppColors.theme['tertiaryColor'],
      child: Column(
        children: [
          IconButton(
            onPressed: () async {
              imageModel.delete();
              provider.notify();
            },
            icon: Icon(Icons.close_rounded)
          ),

          StreamBuilder<String>(
            stream: imageModel.uri?.asStream(),
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
                      return const CircularProgressIndicator();
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
    );
  }
}