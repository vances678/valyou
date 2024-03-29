/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/data/value_template.dart';

///
class DataRepository {
  ///
  final DocumentReference user =
      FirebaseFirestore.instance.collection("users").doc("testUserID");

  ///
  Stream<QuerySnapshot> getValueStream() {
    return user.collection("values").snapshots();
  }

  ///
  Future<DocumentReference> addValue(Value value) {
    return user.collection("values").add(value.toJson());
  }

  ///
  Future<Value> getValue(String referenceID) async {
    var document = user.collection("values").doc(referenceID);
    return document.get().then((snapshot) => Value.fromSnapshot(snapshot));
  }

  ///
  void updateValue(String referenceID, Value value) async {
    user.collection("values").doc(referenceID).update(value.toJson());
  }

  ///
  void deleteValue(Value value) async {
    await user.collection("values").doc(value.referenceID).delete();
  }

  ///
  Stream<QuerySnapshot> getValueTemplateStream() {
    return user.collection("valueTemplates").snapshots();
  }

  ///
  Future<DocumentReference> addValueTemplate(ValueTemplate valueTemplate) {
    return user.collection("valueTemplates").add(valueTemplate.toJson());
  }

  ///
  void updateValueTemplate(ValueTemplate valueTemplate) async {
    await user
        .collection("valueTemplates")
        .doc(valueTemplate.referenceID)
        .update(valueTemplate.toJson());
  }

  ///
  void deleteValueTemplate(ValueTemplate valueTemplate) async {
    await user
        .collection("valueTemplates")
        .doc(valueTemplate.referenceID)
        .delete();
  }
}
