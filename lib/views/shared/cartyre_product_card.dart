import 'package:bsafproductinfo/views/shared/appstyle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bsafproductinfo/firebase_options.dart';
import 'dart:convert';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bsafproductinfo/models/cartyre_model.dart';

class CarTyre_ProductCard extends StatefulWidget {
  const CarTyre_ProductCard(
      {Key? key,
      //required this.price,
      required this.category,
      required this.brand,
      required this.id,
      required this.image,
      required this.description,
      required this.materialcode,
      required this.inch,
      required this.size,
      required this.pattern,
      required this.LI_SI,
      required this.segment,
      required this.rimInches,
      required this.tyreSize,
      required this.REP_WAR,
      required this.fitmentmake_and_model,
      required this.LI_SS,
      required this.RFT,
      required this.XL,
      required this.TDG})
      : super(key: key);

  final String LI_SI;
  final String pattern;
  final String size;
  final String category;
  final String brand;
  final String id;
  final String image;
  final String description;
  final String materialcode;
  final String inch;
  final String segment;
  final String rimInches;
  final String tyreSize;
  final String REP_WAR;
  final String fitmentmake_and_model;
  final String LI_SS;
  final String RFT;
  final String XL;
  final String TDG;

  @override
  State<CarTyre_ProductCard> createState() => _CarTyre_ProductCardState();
}

class _CarTyre_ProductCardState extends State<CarTyre_ProductCard> {
  @override
  Widget build(BuildContext context) {
    /*
    StreamBuilder<List<CarTyreModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong${snapshot.error}");
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return Wrap(
              children: carTyreModel.map(buildUser).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });

    */
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),

      /*
      child: StreamBuilder<List<CarTyreModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong: ${snapshot.error}");
          } else if (snapshot.hasData) {
            final carTyreModels = snapshot.data!;
            return ListView.builder(
              itemCount: carTyreModels.length,
              itemBuilder: (context, index) {
                final carTyreModel = carTyreModels[index];
                return buildCarTyreCard(carTyreModel);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      */
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      //width: MediaQuery.of(context).size.width*5,
                      height: MediaQuery.of(context).size.height * 0.29,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          alignment: Alignment.center,
                          //fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: null,
                          child: Icon(CommunityMaterialIcons.heart_outline),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category,
                      style: appstyleWithHt(
                          30, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category,
                      style:
                          appstyleWithHt(13, Colors.grey, FontWeight.bold, 1.5),
                    ),
                    Text(
                      widget.description,
                      style: appstyleWithHt(
                          13, Colors.black, FontWeight.bold, 1.5),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.size,
                      style: appstyle(27, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text("Size",
                            style: appstyle(
                              18,
                              Colors.grey,
                              FontWeight.w500,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: Text(""),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<CarTyreModel>> readUsers() => FirebaseFirestore.instance
      .collection("CarTyres")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => CarTyreModel.fromJson(doc.data()))
          .toList());


}
