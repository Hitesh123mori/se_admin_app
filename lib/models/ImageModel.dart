import 'package:se_admin_app/apis/FirebaseAPIs.dart';

/// id : "a"
/// path : "p"

class ImageModel {
  ImageModel({
      this.fullPath,
      this.uri,
      this.callback
  });

  ImageModel.fromJson(dynamic json) {
    fullPath = json['fullPath'];
    uri = json['uri'];
  }
  String? fullPath;
  Future<String>? uri;
  void Function()? callback;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullPath'] = fullPath;
    map['uri'] = uri;
    return map;
  }

  Future<void> delete()async {
    if(fullPath == null) return;
    FirebaseAPIs.fireStoreAPI.child(fullPath!).delete();
    callback!;
  }
}