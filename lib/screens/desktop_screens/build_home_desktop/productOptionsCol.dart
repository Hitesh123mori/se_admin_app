import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';

import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/models/product.dart';
import 'package:se_admin_app/screens/desktop_screens/options_desktop/product_detail_desk/product_details_desktop.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/product_card.dart';

class ProductOptionsCol extends StatefulWidget {
  const ProductOptionsCol({Key? key}) : super(key: key);

  @override
  State<ProductOptionsCol> createState() => _ProductOptionsColState();
}

class _ProductOptionsColState extends State<ProductOptionsCol> {
  bool isSearching = false;
  bool isFirstLoad = true;
  List<Product> searchProduct = [];
  List<Product> productList = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child) {
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
                      child: TextFormField(
                        controller: _controller,
                        onTap: () {
                          setState(() {
                            isSearching = true;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            searchProduct = productList
                                .where((product) => product.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        cursorColor: AppColors.theme['highlightColor'],
                        style: TextStyle(
                          color: AppColors.theme['secondaryColor'],
                        ),
                        textAlign: TextAlign.center,
                        autocorrect: true,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          hintText: 'Search Here',
                          hintStyle: TextStyle(
                            color: AppColors.theme['secondaryColor'],
                          ),
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
                InkWell(
                  onTap: () {
                    setState(() {
                      isSearching = false;
                      _controller.text = '';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.theme['tertiaryColor'],
                    ),
                    height: 50,
                    width: 50,
                    child: Icon(
                      isSearching ? Icons.cancel_outlined : Icons.add,
                      color: AppColors.theme['secondaryColor'],
                      size: 25,
                    ),
                  ),
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
                    .collection('products')
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
                  productList =
                      data?.map((e) => Product.fromJson(e.data())).toList() ??
                          [];
                  if(productList.isNotEmpty && isFirstLoad) {
                    product.updateCurrent(productList.first);
                    isFirstLoad = !isFirstLoad;
                  }

                  if (productList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No products found",
                        style: TextStyle(color: Colors.white60),
                      ),
                    );
                  }
                  if (isSearching && searchProduct.isEmpty) {
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
                          ? searchProduct.length
                          : productList.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: isSearching
                              ? searchProduct[index]
                              : productList[index],
                          isClicked: isSearching
                              ? searchProduct[index].id == product.current?.id
                              : productList[index].id == product.current?.id,
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
