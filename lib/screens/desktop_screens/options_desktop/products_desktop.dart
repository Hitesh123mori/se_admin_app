import 'package:flutter/material.dart' ;

class ProductsDesktop extends StatefulWidget {
  const ProductsDesktop({super.key});

  @override
  State<ProductsDesktop> createState() => _ProductsDesktopState();
}

class _ProductsDesktopState extends State<ProductsDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Products",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
