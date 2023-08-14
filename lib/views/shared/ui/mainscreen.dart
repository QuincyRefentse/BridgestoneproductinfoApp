import 'package:bsafproductinfo/controllers/mainscreen_provider.dart';
import 'package:bsafproductinfo/views/shared/appstyle.dart';
import 'package:bsafproductinfo/views/shared/bottom_nav_widget.dart';
import 'package:bsafproductinfo/views/shared/ui/cartpage.dart';
import 'package:bsafproductinfo/views/shared/ui/homepage.dart';
import 'package:bsafproductinfo/views/shared/ui/profilepage.dart';
import 'package:bsafproductinfo/views/shared/ui/searchpage.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../bottm_nav.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    //int pageIndex = 0;
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        //static Color primary = Color(0xFFFF0000);
        //static Color secondary = Color(0xFF333333);
        //backgroundColor: const Color(0xFFFF0000),

        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: BottomNavBar(),
      );
      ;
    });
  }
}

