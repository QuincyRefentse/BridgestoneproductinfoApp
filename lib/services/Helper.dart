import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:bsafproductinfo/models/cartyre_model.dart";


//Create a Class named FirebaseAPI that fetches data from firebase collection named Cartyres,it should retrieve the following fields  and returns it to the app product card
//This Class fetches data from firebase and returns it to the app product card
class FirebaseAPI {
  static Future<void> addTyre(CarTyreModel carTyres)async{
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
