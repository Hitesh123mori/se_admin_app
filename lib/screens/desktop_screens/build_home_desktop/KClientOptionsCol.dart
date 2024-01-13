import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';

import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/models/client.dart';
import 'package:se_admin_app/models/product.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/client_card.dart';
import 'package:se_admin_app/utils/widgets/product_card.dart';

class KClientOptionsCol extends StatefulWidget {
  const KClientOptionsCol({super.key});

  @override
  State<KClientOptionsCol> createState() => _KClientOptionsColState();
}

class _KClientOptionsColState extends State<KClientOptionsCol> {
  String searchText = "";
  bool firstTimeLoad = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<KClientProvider>(builder: (context, kClient, child){
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
                    BoxConstraints(minWidth: 190, minHeight: 50),
                    width: 190,
                    height: 50,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: Center(
                          child: GestureDetector(
                            child: TextFormField(
                              onChanged: (value){
                                setState(() {
                                  searchText = value; // Convert to lowercase
                                  firstTimeLoad = true;
                                  print("===================================");
                                });
                              },
                              cursorColor: AppColors.theme['highlightColor'],
                              style: TextStyle(
                                  color: AppColors
                                      .theme['secondaryColor']),
                              textAlign: TextAlign.center,
                              autocorrect: true,
                              autovalidateMode:
                              AutovalidateMode.always,
                              decoration: InputDecoration(
                                hintText: 'Search Here',
                                hintStyle: TextStyle(
                                    color: AppColors
                                        .theme['secondaryColor']),
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
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.theme['tertiaryColor']),
                      height: 50,
                      width: 50,
                      child: Icon(
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
              child:   StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('clients')
                    .where('name',
                    isGreaterThanOrEqualTo: searchText)
                    .where('name', isLessThan: '${searchText}z')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }



                  var documents = snapshot.data?.docs;
                  print("#doc: ${documents!.first['name']}");

                  if(documents.isEmpty){
                    return const Text("No match found", style: TextStyle(color: Colors.white),);
                  }

                  if(firstTimeLoad) {
                    kClient.current = KClient.fromJson(documents.first.data());
                    if(kClient.current!.name.contains(searchText)) firstTimeLoad = false;
                  }

                  print("#cp: ${kClient.current?.id}");

                  return SizedBox(
                    height: mq.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        var document = documents[index];
                        var obj = KClient.fromJson(document.data());
                        // Build your UI here using the document data
                        return ClientCard(client: obj);
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
