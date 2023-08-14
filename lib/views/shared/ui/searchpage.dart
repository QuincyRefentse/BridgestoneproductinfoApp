import 'package:flutter/material.dart';

import '../appstyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is search page",
          style: appstyle(40, Color(0xFFFF0000), FontWeight.bold),
        ),
      ),
    );
  }
}
