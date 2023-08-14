import 'package:flutter/material.dart';

import '../appstyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Cart Page",
          style: appstyle(40, Color(0xFFFF0000), FontWeight.bold),
        ),
      ),
    );
  }
}
