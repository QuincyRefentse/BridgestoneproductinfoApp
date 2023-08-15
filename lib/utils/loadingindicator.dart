import 'package:bsafproductinfo/views/shared/ui/mainscreen.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.repeat();
    _startTimer();
  }
  _startTimer() async {
    // Delay for 3 seconds
    await Future.delayed(Duration(seconds: 2));

    // Show circular progress indicator for 2 seconds
    setState(() {
      _isLoading = false;
    });

    await Future.delayed(Duration(seconds: 2));

    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 100,
                  child: Image.asset("assets/images/Bridgestone Logo.png"),
                ),
                Container(
                  width: 200,
                  height: 250,
                  child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/tyreA.png"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Text(
                'BSAF | Software Developer | Refentse Quincy Moeng| quincy.moeng@bridgestone.co.za ',
                style: TextStyle(fontSize: 8, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

