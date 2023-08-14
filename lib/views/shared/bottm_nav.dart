import "package:bsafproductinfo/controllers/mainscreen_provider.dart";
import "package:community_material_icon/community_material_icon.dart";
import"package:flutter/material.dart";
import "package:ionicons/ionicons.dart";
import "package:provider/provider.dart";

import "bottom_nav_widget.dart";

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context,mainScreenNotifier,child){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFFF0000),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavWidget(
                      onTap: () {
                        mainScreenNotifier.pageIndex = 0;
                      },
                      icon: mainScreenNotifier.pageIndex == 0
                          ? CommunityMaterialIcons.home
                          : CommunityMaterialIcons.home_outline,
                    ),
                    BottomNavWidget(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 1;
                        },
                        icon: mainScreenNotifier.pageIndex == 1
                            ? Ionicons.search
                            : Ionicons.search_outline),
                    BottomNavWidget(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 2;
                        },
                        icon: mainScreenNotifier.pageIndex == 2
                            ? Ionicons.add_circle
                            : Ionicons.add_circle_outline),

                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
