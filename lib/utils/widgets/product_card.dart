import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';
import 'package:se_admin_app/models/product.dart';

import '../colors.dart';

class ProductCard extends StatefulWidget {
  final Product product ;
  bool isClicked = false ;
   ProductCard({super.key, required this.product,required this.isClicked});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  bool isHover = false ;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child){
      return MouseRegion(
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: InkWell(
          onTap: (){
            setState(() {
            product.updateCurrent(widget.product);
            });
          },
          child: Container(
            height: 55,
            color: isHover ? Colors.white10 : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.isClicked)
                  Container(
                    height: 30,
                    width: 5,
                    color: AppColors.theme['highlightColor'],
                  ),
                const SizedBox(width: 10,),

                SizedBox(
                  width: 190,
                  child: Text(
                    widget.product.name,
                    softWrap: true,
                    style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
                  ),
                ),
                Expanded(child: Container()),

                if(widget.isClicked)
                  IconButton(
                    onPressed: (){
                      _showDeleteConfirmationDialog(context, widget.product, product);
                    },
                    icon: Icon(Icons.close_rounded,size: 18, color: AppColors.theme['highlightColor']))
              ],
            ),
          ),
        ),
      );

    });


  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, Product? product, ProductProvider provider) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          shadowColor: AppColors.theme["tertiaryColor"],
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.black,
          title: Text('Delete Confirmation', style: TextStyle(color: AppColors.theme['secondaryColor']),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete ${product?.name ?? ''}?',
                  style: TextStyle(color: AppColors.theme['secondaryColor']),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel',style: TextStyle(color: AppColors.theme['secondaryColor']),),
            ),
            TextButton(
              onPressed: () {
                product?.delete(provider);
                provider.current = null;
                if(product != null) provider.removeFromSearchList(product);
                Navigator.of(context).pop();
                Fluttertoast.showToast(
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  msg: "${product!.name} Deleted",
                  webShowClose: true,
                  webBgColor: "#14181a",
                  backgroundColor: Colors.black,
                  gravity: ToastGravity.BOTTOM_RIGHT,
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.redAccent, fontSize: 16),),
            ),
          ],
        );
      },
    );
  }

}
