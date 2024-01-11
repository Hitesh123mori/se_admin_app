import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';

import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/models/product.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/product_card.dart';

class ProductOptionsCol extends StatefulWidget {
  const ProductOptionsCol({super.key});

  @override
  State<ProductOptionsCol> createState() => _ProductOptionsColState();
}

class _ProductOptionsColState extends State<ProductOptionsCol> {
  String searchText = "";
  bool firstTimeLoad = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child){
      return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.theme['tertiaryColor'],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white24,
              ),
            ),
            constraints: const BoxConstraints(minWidth: 250,),
            width: mq.width * 0.15,
            height: mq.height * 1,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: mq.width * 0.007),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: mq.width * 0.007,),

                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.theme['primaryColor'],
                                border: Border.all(
                                  color: Colors.white24,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(minWidth: 190, minHeight: 50),
                              width: 185,
                              height: 50,

                              child: Center(
                                child: Container(
                                  width: 195,
                                  height: 50,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        searchText = value; // Convert to lowercase
                                        firstTimeLoad = true;
                                        print("===================================");
                                      });
                                    },
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
                                  // isSearching
                                  //     ? Icons.cancel_outlined:
                                      Icons.add,
                                  color: AppColors.theme['secondaryColor'],
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                    ),


                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .where('name',
                          isGreaterThanOrEqualTo: searchText)
                          .where('name', isLessThan: searchText + 'z')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }



                        var documents = snapshot.data?.docs;
                        print("#doc: ${documents!.first['name']}");

                        if(documents?.length == 0){
                          return Text("No match found", style: TextStyle(color: Colors.white),);
                        }

                        if(firstTimeLoad) {
                          product.current = Product.fromJson(documents!.first.data());
                          if(product.current!.name.contains(searchText)) firstTimeLoad = false;
                        }

                        print("#cp: ${product.current?.id}");

                        return SizedBox(
                          height: mq.height,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: documents?.length,
                            itemBuilder: (context, index) {
                              var document = documents?[index];
                              var pro = Product.fromJson(document!.data());
                              // Build your UI here using the document data
                              return ProductCard(
                                product: pro,
                                isClicked: pro.id==product.current?.id,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ]
                ),
              ),
            ),
          )
      );
    });
  }
}
