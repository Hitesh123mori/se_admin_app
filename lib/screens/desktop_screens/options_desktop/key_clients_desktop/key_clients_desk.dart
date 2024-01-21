import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/image_drop_zone.dart';

class ClientsDetailDesktop extends StatefulWidget {
  const ClientsDetailDesktop({super.key});

  @override
  State<ClientsDetailDesktop> createState() => _ClientsDetailDesktopState();
}

class _ClientsDetailDesktopState extends State<ClientsDetailDesktop> {

  bool isEditMode = false;
  TextEditingController nameTEC = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Consumer<KClientProvider>(builder: (context, kClientProvider, child) {
      return Expanded(
        child:  Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                        minHeight: 50
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.theme['tertiaryColor'],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white24,
                      ),
                    ),
                    height: 50,
                    child: Center(
                      child: !isEditMode
                          ? Text(
                        kClientProvider.current?.name ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.theme['secondaryColor']),
                      )
                          : TextFormField(
                        cursorColor: AppColors.theme['highlightColor'],
                        decoration:InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: AppColors.theme['tertiaryColor']
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.theme['secondaryColor']
                        ),
                        controller: nameTEC,
                        autofocus: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: mq.width * 0.007,),
                Padding(
                  padding: EdgeInsets.only(right: mq.width * 0.007),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isEditMode) {
                          kClientProvider.current?.name = nameTEC.text;
                          // print("#ID ${kClientProvider.current?.id}");
                          kClientProvider.current?.update();
                        }
                        isEditMode = !isEditMode;
                        nameTEC.text = kClientProvider.current?.name ?? "";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.white24),
                      ),
                      backgroundColor: AppColors.theme['primaryColor'],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        isEditMode ? "Save" : "Edit",
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
            SizedBox(
              height: mq.width * 0.007,
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(right: mq.width * 0.007),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.theme['tertiaryColor'],
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),
                  child: kClientProvider.current == null
                      ? Container()
                      : SizedBox(
                    width: mq.width*1,
                    height: mq.height*1,
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                StreamBuilder(
                                    stream:
                                    kClientProvider.current!.getImage(kClientProvider).asStream(),
                                    builder: (context, snap) {
                                      // print("#snap: ${snap.data}");
                                      if(snap.hasData){
                                        // print("#hd: ${snap.data}");
                                        // return Container();
                                        return ImageDropZone(imgFiles: snap.data, provider: kClientProvider,);
                                      }

                                      else {
                                        return const CircularProgressIndicator();
                                      }
                                    }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
