import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';

import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/models/client.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/client_card.dart';

class KClientOptionsCol extends StatefulWidget {
  const KClientOptionsCol({super.key});

  @override
  State<KClientOptionsCol> createState() => _KClientOptionsColState();
}

class _KClientOptionsColState extends State<KClientOptionsCol> {
  bool isSearching = false;
  List<KClient> searchClient = [];
  List<KClient> kClientList = [];
  TextEditingController _controller = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Consumer<KClientProvider>(builder: (context, kClient, child) {
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
                    constraints: const BoxConstraints(minWidth: 190, minHeight: 50),
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
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                searchClient = kClientList
                                    .where((client) => client.name
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
              constraints: const BoxConstraints(
                minWidth: 250,
              ),
              width: mq.width * 0.15,
              height: mq.height * 1,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('clients')
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
                  kClientList = data?.map((e) => KClient.fromJson(e.data())).toList() ?? [];

                  if(kClientList.isNotEmpty) kClient.updateCurrent(kClientList.first);

                  if (kClientList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No clients found",
                        style: TextStyle(color: Colors.white60),
                      ),
                    );
                  }
                  if (isSearching && searchClient.isEmpty) {
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
                          ? searchClient.length
                          : kClientList.length,
                      itemBuilder: (context, index) {
                        return ClientCard(
                          client: isSearching
                              ? searchClient[index]
                              : kClientList[index],
                          isClicked: isSearching
                              ? searchClient[index].id == kClient.current?.id
                              : kClientList[index].id == kClient.current?.id,
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
