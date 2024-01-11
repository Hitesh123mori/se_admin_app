import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';
import 'package:se_admin_app/models/product.dart';

import '../utils/widgets/product_card.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String searchText = "";
  bool firstTimeLoad = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child){

       return Scaffold(
        appBar: AppBar(
          title: Text('Firebase Data with Search'),
        ),
        body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value; // Convert to lowercase
                    firstTimeLoad = true;
                    print("===================================");
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
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

                  return ListView.builder(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    });

  }
}
