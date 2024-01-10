import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se_admin_app/apis/FirebaseAPI.dart';

import '../../models/client.dart';

class Content{

  static Future<Map<String, dynamic>> getContent (String collection, String doc) async {
    final docRef = FirebaseAPI.dbAPI.collection(collection).doc(doc);
    return docRef.get().then(
            (DocumentSnapshot docSS) {
                Map<String, dynamic> datai = docSS.data() as Map<String, dynamic>;
                print("#Datai = $datai");
                return datai;
            }
    );
  }

}
