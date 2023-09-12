import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DatabaseServices {
  static Future<String> addData(String title, String detail) async {
    await firebaseFirestore
        .collection("notes")
        .add({"title": title, "detail": detail});
    return "ADD Successfully";
  }

  static Future<void> deleteData(String id) async {
    await firebaseFirestore.collection("notes").doc(id).delete();
  }

  static Future<void> updateData(String id, String title, String detail) async {
    await firebaseFirestore
        .collection("notes")
        .doc(id)
        .update({"title": title, "detail": detail});
  }
}
