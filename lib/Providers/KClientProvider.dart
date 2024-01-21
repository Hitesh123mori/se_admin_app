import 'package:flutter/widgets.dart';
import 'package:se_admin_app/models/client.dart';


class KClientProvider extends ChangeNotifier{
  KClient? current;
  bool isNew = false;
  List<KClient> searchClient = [];
  List<KClient> kClientList = [];

  void updateCurrent(KClient newKClient){
    current = newKClient;
    notifyListeners();
  }

  void updateSearchList(String searchText){
    searchClient = kClientList
        .where((kClient) =>
        kClient.name.toLowerCase().startsWith(searchText)
    ).toList();
    searchClient.sort((KClient a, KClient b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void removeFromSearchList(KClient product){
    searchClient.remove(product);
    notifyListeners();
  }

  void notify(){
    notifyListeners();
  }
}