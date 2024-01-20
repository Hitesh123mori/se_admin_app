import 'dart:async';

import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';
import 'package:se_admin_app/main.dart';
import 'package:flutter/material.dart' ;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:synchronized/synchronized.dart';

import 'package:se_admin_app/models/product.dart';

class ProductDetailDesktop extends StatefulWidget {

  const ProductDetailDesktop({super.key});

  @override
  State<ProductDetailDesktop> createState() => _ProductDetailDesktopState();


}

class _ProductDetailDesktopState extends State<ProductDetailDesktop> {
  Product? current;

  bool isEditMode = false;
  TextEditingController nameTEC = TextEditingController();

  Future<void> getImage() async {
      var mediaData = await ImagePickerWeb.getImageInfo;

      print("#img: ${mediaData?.fileName}");
      if (mediaData?.data == null) return;
      
      await current?.uploadImage(mediaData);
      
      setState(() {
        print("ok");
      });
    // print("#path: ${imageFile?.name}");
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productPro, child){
      current = productPro.current;
      return Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: mq.width * 0.007, bottom: mq.width * 0.007),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white24,
                          ),
                        ),
                        width: 200,
                        height: 50,
                        child: Center(
                          child: !isEditMode
                              ?Text(
                                productPro.current?.name ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.theme['secondaryColor']),
                              )
                              :TextFormField(
                                style: TextStyle(color: AppColors.theme['secondaryColor']),
                                controller: nameTEC,
                                autofocus: true,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: mq.width * 0.007),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if(isEditMode){
                              productPro.current?.name = nameTEC.text;
                              print("#ID ${productPro.current?.id}");
                              productPro.current?.update();
                            }
                            isEditMode = !isEditMode;
                            nameTEC.text = productPro.current?.name ?? "";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.white24),
                          ), backgroundColor: AppColors.theme['primaryColor'],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            isEditMode? "Save": "Edit",
                            style: TextStyle(
                              color: AppColors.theme['secondaryColor'],
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: mq.width * 0.007,),

                Row(
                  children: [
                    Expanded(
                      child: Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.theme['tertiaryColor'],
                          // color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white24,
                          ),
                        ),
                        height: mq.height*0.70,
                        child: productPro.current == null ?
                        Container()
                        :Column(
                          children: [
                            TextButton(
                                onPressed: () async {
                                    await getImage();
                                    productPro.notify();
                                    await Future.delayed(const Duration(seconds: 5), () {setState(() {});});
                                    print("#com");
                                  },
                                child:const Text("upload Image")),
                            StreamBuilder(stream: productPro.current!.getImage().asStream(),
                                builder: (context, snap){
                                  if (snap.connectionState != ConnectionState.done) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (snap.hasData) {
                                    if(snap.data == "null") return const Text("no Image", style: TextStyle(color: Colors.white),);
                                    print("#dbImg ${snap.data}");
                                    return Image.network(snap.data,
                                      height: mq.height*.4,
                                      width: mq.width*.6,
                                      loadingBuilder: (context, child, loadingProcess){
                                        if(loadingProcess == null) {
                                          return child;
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      },
                                    );
                                  } else if(snap.hasError){
                                    print("#PDD-error: ${snap.error} ${snap.stackTrace}");
                                    return const Text("Error", style: TextStyle(color: Colors.white),);
                                  }
                                  else{
                                    return const Text("no Image", style: TextStyle(color: Colors.white),);
                                  }
                                })
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    );


  }
}
