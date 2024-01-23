import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/InfoProvider.dart';
import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/utils/colors.dart';

class InfoDesktop extends StatefulWidget {
  const InfoDesktop({super.key});

  @override
  State<InfoDesktop> createState() => _InfoDesktopState();
}

class _InfoDesktopState extends State<InfoDesktop> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoProvider>(
      builder: (context, infoProvider, child) {
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      decoration: BoxDecoration(
                        color: AppColors.theme['tertiaryColor'],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white24,
                        ),
                      ),
                      height: 50,
                      child: Center(
                          child: Text(
                        infoProvider.current,
                        style: TextStyle(fontSize: 16, color: AppColors.theme['secondaryColor']),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: mq.width * 0.007,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: mq.width * 0.007),
                    child: ElevatedButton(
                      onPressed: () {
                        if (isEditMode) {
                          print("#ID ${infoProvider.infoTEC.entries}");

                          infoProvider.infoTEC.keys.forEach((element) {
                            infoProvider.update(element, infoProvider.infoTEC[element]?.text ?? "");
                          });
                        }

                        isEditMode = !isEditMode;
                        setState(() {});
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
                  padding: EdgeInsets.only(right: mq.width * 0.007),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.theme['tertiaryColor'],
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white24,
                      ),
                    ),
                    child: SizedBox(
                      width: mq.width * 1,
                      height: mq.height * 1,
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  StreamBuilder(
                                      stream: infoProvider.getInfo().asStream(),
                                      builder: (context, snap) {
                                        if (snap.hasData) {
                                          Map<String, dynamic> dataIP = snap.data!.data() ?? {"": ""};
                                          print("#data: ${dataIP.keys}");
                                          infoProvider.infoTEC = {};

                                          dataIP.keys.toList().forEach((element) {
                                            infoProvider.infoTEC[element] = TextEditingController();
                                            infoProvider.infoTEC[element]?.text = dataIP[element];
                                          });

                                          print("#len: ${infoProvider.infoTEC.length}");
                                          bool isContactUs = infoProvider.current == "Contact Us";

                                          return Column(
                                            children: infoProvider.infoTEC.entries.map((e) {
                                              print("#tec: ${e.key}: ${e.value.text}");
                                              return !isEditMode
                                                  ? e.value.text == ""
                                                      ? Container()
                                                      : Padding(
                                                          padding: const EdgeInsets.all(20),
                                                          child: Container(
                                                            width: mq.width,
                                                            // height: 200,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              border: Border.all(
                                                                color: Colors.white24,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10),
                                                              child: Text(
                                                                e.value.text,
                                                                style: TextStyle(fontSize: 16, color: AppColors.theme['secondaryColor']),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                  : Padding(
                                                      padding: const EdgeInsets.all(20),
                                                      child: Container(
                                                        width: mq.width,
                                                        // height: 200,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          border: Border.all(color: Colors.white24),
                                                        ),
                                                        child: TextFormField(
                                                          cursorColor: AppColors.theme['highlightColor'],
                                                          keyboardType: TextInputType.multiline,
                                                          maxLines: null,
                                                          decoration: InputDecoration(
                                                            border: const OutlineInputBorder(
                                                              borderSide: BorderSide.none,
                                                            ),
                                                            fillColor: AppColors.theme['tertiaryColor'],
                                                            hintText: isContactUs ? e.key : "",
                                                            hintStyle: TextStyle(color: AppColors.theme['secondaryColor']),
                                                            labelText: isContactUs ? e.key : "",
                                                            labelStyle: TextStyle(color: AppColors.theme['secondaryColor']),
                                                          ),
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(color: AppColors.theme['secondaryColor']),
                                                          controller: e.value,
                                                        ),
                                                      ),
                                                    );
                                            }).toList(),
                                          );
                                        } else
                                          return CircularProgressIndicator();
                                      })
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
      },
    );
  }
}
