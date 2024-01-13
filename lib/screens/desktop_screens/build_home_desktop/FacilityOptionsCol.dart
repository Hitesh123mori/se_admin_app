import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  List<Facility> searchFacility = [];
  List<Facility> facilityList = [];
  TextEditingController _controller = TextEditingController() ;

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
                    constraints: BoxConstraints(minWidth: 190, minHeight: 50),
                    width: 190,
                    height: 50,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: Center(
                          child: TextFormField(
                            controller: _controller,
                            onTap: () {
                              setState(() {
                                isSearching = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                searchFacility = facilityList
                                    .where((facility) => facility.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                            cursorColor: AppColors.theme['highlightColor'],
                            style: TextStyle(
                                color: AppColors.theme['secondaryColor']),
                            textAlign: TextAlign.center,
                            autocorrect: true,
                            autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              hintText: 'Search Here',
                              hintStyle: TextStyle(
                                  color: AppColors.theme['secondaryColor']),
                              border: OutlineInputBorder(
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
                  onTap: isSearching ? (){
                    setState(() {
                      isSearching = false ;
                      _controller.text = '' ;

                    });
                  }:
                      () {},
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.theme['tertiaryColor']),
                      height: 50,
                      width: 50,
                      child: Icon(
                        isSearching ?Icons.cancel_outlined :
                        Icons.add,
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
              constraints: BoxConstraints(
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
                  facilityList = data?.map((e) => Facility.fromJson(e.data())).toList() ?? [];

                  if (facilityList?.isEmpty ?? true) {
                    return Center(
                      child: Text(
                        "No facility found",
                        style: TextStyle(color: Colors.white60),
                      ),
                    );
                  }
                  if (isSearching && searchFacility.isEmpty) {
                    return Center(
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
                      physics: BouncingScrollPhysics(),
                      itemCount: isSearching
                          ? searchFacility.length
                          : facilityList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return FacilityCard(
                          facility: isSearching
                              ? searchFacility[index]
                              : facilityList[index],
                          isClicked: isSearching
                              ? searchFacility[index].id == facilityPro.current?.id
                              : facilityList[index].id == facilityPro.current?.id,
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
