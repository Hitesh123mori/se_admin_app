import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/models/facility.dart';
import 'package:se_admin_app/utils/colors.dart';
import '../../../Providers/FacilityProvider.dart';
import '../../../utils/widgets/facility_card.dart';

class FacilityOptionsCol extends StatefulWidget {
  const FacilityOptionsCol({super.key});

  @override
  State<FacilityOptionsCol> createState() => _FacilityOptionsColState();
}

class _FacilityOptionsColState extends State<FacilityOptionsCol> {
  bool isSearching = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FacilityProvider>(builder: (context, facilityPro, child) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: mq.width * 0.007),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: mq.width * 0.007,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.theme['primaryColor'],
                      border: Border.all(
                        color: Colors.white24,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 190, minHeight: 50),
                    width: 190,
                    height: 50,
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: Center(
                          child: TextFormField(
                            controller: _controller,
                            onTap: () {
                              setState(() {
                                isSearching = true;
                                facilityPro.searchFacility =
                                    facilityPro.facilityList;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                if (value == "") {
                                  facilityPro.searchFacility =
                                      facilityPro.facilityList;
                                } else {
                                  facilityPro
                                      .updateSearchList(value.toLowerCase());
                                }
                              });
                            },
                            cursorColor: AppColors.theme['highlightColor'],
                            style: TextStyle(
                                color: AppColors.theme['secondaryColor']),
                            textAlign: TextAlign.start,
                            autocorrect: true,
                            autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              hintText: 'Search Here',
                              prefixIcon: Icon(
                                Icons.search,
                                size: 22,
                              ),
                              prefixIconColor:
                                  AppColors.theme['secondaryColor'],
                              hintStyle: TextStyle(
                                  color: AppColors.theme['secondaryColor']),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: isSearching
                      ? () {
                          setState(() {
                            isSearching = false;
                            _controller.text = '';
                          });
                        }
                      : () {
                          Facility newFacility = Facility(
                              name: "New facility",
                              discription: "Click here to add description here",
                              imagePath: "");
                          newFacility.add();
                          facilityPro.isNew = true;
                          facilityPro.current = newFacility;
                          facilityPro.notify();
                          Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 5,
                            msg: "Congratulations! for new facility",
                            webShowClose: true,
                            webBgColor: "#14181a",
                            backgroundColor: Colors.black,
                            gravity: ToastGravity.BOTTOM_RIGHT,
                          );
                        },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.theme['tertiaryColor']),
                      height: 50,
                      width: 50,
                      child: Icon(
                        isSearching ? Icons.cancel_outlined : Icons.add,
                        color: AppColors.theme['secondaryColor'],
                        size: 25,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.theme['tertiaryColor'],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              constraints: const BoxConstraints(
                minWidth: 250,
              ),
              width: mq.width * 0.15,
              height: mq.height * 1,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('facilities')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.theme['highlightColor'],
                      ),
                    );
                  }
                  final data = snapshot.data?.docs;
                  facilityPro.facilityList =
                      data?.map((e) => Facility.fromJson(e.data())).toList() ??
                          [];

                  // if(facilityList.isNotEmpty) facilityPro.updateCurrent(facilityList.first);

                  if (facilityPro.facilityList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No facility found",
                        style: TextStyle(color: Colors.white60),
                      ),
                    );
                  }
                  if (isSearching && facilityPro.searchFacility.isEmpty) {
                    return const Center(
                      child: Text(
                        "No search results found",
                        style: TextStyle(color: Colors.white60),
                      ),
                    );
                  }
                  return SizedBox(
                    height: mq.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: isSearching
                          ? facilityPro.searchFacility.length
                          : facilityPro.facilityList.length,
                      itemBuilder: (context, index) {
                        return FacilityCard(
                          facility: isSearching
                              ? facilityPro.searchFacility[index]
                              : facilityPro.facilityList[index],
                          isClicked: isSearching
                              ? facilityPro.searchFacility[index].id ==
                                  facilityPro.current?.id
                              : facilityPro.facilityList[index].id ==
                                  facilityPro.current?.id,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
