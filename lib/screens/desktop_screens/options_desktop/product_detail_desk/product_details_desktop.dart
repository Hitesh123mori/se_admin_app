import 'package:flutter/material.dart' ;
import '../../../../models/product.dart';

class ProductDetailDesktop extends StatefulWidget {
  final Product product ;
  const ProductDetailDesktop({super.key, required this.product});

  @override
  State<ProductDetailDesktop> createState() => _ProductDetailDesktopState();
}

class _ProductDetailDesktopState extends State<ProductDetailDesktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(widget.product.name,style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
