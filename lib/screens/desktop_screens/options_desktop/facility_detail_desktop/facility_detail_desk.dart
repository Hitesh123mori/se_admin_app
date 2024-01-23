import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/FacilityProvider.dart';
import 'package:se_admin_app/main.dart';
import 'package:flutter/material.dart';
import 'package:se_admin_app/utils/colors.dart';

import 'package:se_admin_app/utils/widgets/image_drop_zone.dart';

class FacilityDetailDesktop extends StatefulWidget {
  const FacilityDetailDesktop({super.key});

  @override
  State<FacilityDetailDesktop> createState() => _FacilityDetailDesktopState();
}

class _FacilityDetailDesktopState extends State<FacilityDetailDesktop> {
  bool isEditMode = false;
  TextEditingController nameTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();

  final _focusNode = FocusNode();

  @override
  initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        descriptionTEC.selection = TextSelection(
            baseOffset: 0, extentOffset: descriptionTEC.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FacilityProvider>(
        builder: (context, facilityProvider, child) {
      if (facilityProvider.isNew) {
        isEditMode = true;
        nameTEC.text = facilityProvider.current?.name ?? "";
        descriptionTEC.text = facilityProvider.current?.discription ?? "";
        nameTEC.selection = TextSelection(
          baseOffset: 0,
          extentOffset: nameTEC.text.length,
        );

        facilityProvider.isNew = false;
      }
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
                      child: !isEditMode
                          ? Text(
                              facilityProvider.current?.name ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.theme['secondaryColor']),
                            )
                          : TextFormField(
                              cursorColor: AppColors.theme['highlightColor'],
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: AppColors.theme['tertiaryColor']),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.theme['secondaryColor']),
                              controller: nameTEC,
                              autofocus: true,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mq.width * 0.007,
                ),
                Padding(
                  padding: EdgeInsets.only(right: mq.width * 0.007),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isEditMode) {
                          facilityProvider.current?.name = nameTEC.text;
                          facilityProvider.current?.discription =
                              descriptionTEC.text;
                          print("#ID ${facilityProvider.current?.id}");
                          facilityProvider.current?.update();
                        }
                        isEditMode = !isEditMode;
                        nameTEC.text = facilityProvider.current?.name ?? "";
                        descriptionTEC.text =
                            facilityProvider.current?.discription ?? "";
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
                  child: facilityProvider.current == null
                      ? Container()
                      : SizedBox(
                          width: mq.width * 1,
                          height: mq.height * 1,
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      !isEditMode
                                          ? Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Container(
                                                width: mq.width,
                                                // height: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.white24,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text(
                                                    facilityProvider.current
                                                            ?.discription ??
                                                        '',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: AppColors.theme[
                                                            'secondaryColor']),
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
                                                  border: Border.all(
                                                      color: Colors.white24),
                                                ),
                                                child: TextFormField(
                                                  cursorColor: AppColors
                                                      .theme['highlightColor'],
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    fillColor: AppColors
                                                        .theme['tertiaryColor'],
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: AppColors.theme[
                                                          'secondaryColor']),
                                                  controller: descriptionTEC,
                                                  focusNode: _focusNode,
                                                ),
                                              ),
                                            ),
                                      StreamBuilder(
                                          stream: facilityProvider.current!
                                              .getImage(facilityProvider)
                                              .asStream(),
                                          builder: (context, snap) {
                                            print("#snap: ${snap.data}");
                                            if (snap.hasData) {
                                              print("#hd: ${snap.data}");
                                              // return Container();
                                              return ImageDropZone(
                                                imgFiles: snap.data,
                                                provider: facilityProvider,
                                              );
                                            } else
                                              return CircularProgressIndicator(
                                                color: AppColors
                                                    .theme['highlightColor'],
                                              );
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
    });
  }
}
