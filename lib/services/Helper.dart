import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:bsafproductinfo/models/tyre_model.dart";

//This Class fetches data from firebase and return
class FirebaseAPI {
  static Future<void> addTyre(TyreModel carTyres)async{
    await FirebaseFirestore.instance.collection("IndustrialTyres").add({
      'id': carTyres.id,
      'image': carTyres.image,
      'description': carTyres.description,
      'brand': carTyres.brand,
      'materialCode': carTyres.materialcode,
      'inch':carTyres.inch,
      'size': carTyres.size,
      'pattern': carTyres.pattern,
      'fitmentMakeAndModel': carTyres.fitmentmakeAndModel,
    });
  }
}
