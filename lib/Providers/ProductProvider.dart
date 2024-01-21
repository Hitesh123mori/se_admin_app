import 'package:flutter/widgets.dart';
import 'package:se_admin_app/models/product.dart';


class ProductProvider extends ChangeNotifier{
  Product? current;
  bool isNew = false;
  List<Product> searchProduct = [];
  List<Product> productList = [];

  void updateCurrent(Product newProduct){
    current = newProduct;
    notifyListeners();
  }

  void updateSearchList(String searchText){
    searchProduct = productList
      .where((product) =>
        product.name.toLowerCase().startsWith(searchText)
      ).toList();
    searchProduct.sort((Product a, Product b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void removeFromSearchList(Product product){
    searchProduct.remove(product);
    notifyListeners();
  }

  void notify(){
    notifyListeners();
  }
}