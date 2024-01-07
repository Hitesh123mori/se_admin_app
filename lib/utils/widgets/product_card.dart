import 'package:flutter/material.dart';
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
      child: Container(
        height: 55,
        color: isHover ? Colors.white10 : Colors.transparent,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              if (widget.isClicked)
                Container(
                  height: 30,
                  width: 5,
                  color: AppColors.theme['highlightColor'],
                ),
              SizedBox(width: 10,),
              Text(
                widget.product.name,
                style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
