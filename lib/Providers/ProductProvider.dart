import 'package:flutter/widgets.dart';
import 'package:se_admin_app/models/product.dart';


class ProductProvider extends ChangeNotifier{
  Product? current;

  void updateCurrent(Product newProduct){
    current = newProduct;
    notifyListeners();
  }
}