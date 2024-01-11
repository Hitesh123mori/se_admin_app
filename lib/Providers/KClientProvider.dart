import 'package:flutter/widgets.dart';
import 'package:se_admin_app/models/client.dart';


class KClientProvider extends ChangeNotifier{
  KClient? current;

  void updateCurrent(KClient newKClient){
    current = newKClient;
    notifyListeners();
  }
}