import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:confetti/confetti.dart';
import 'bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    _startSplashScreenTimer();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  _startSplashScreenTimer() async {
    var duration = Duration(seconds: 0);
    Timer(duration, _showContent);
    Timer(Duration(seconds: 0), _startConfetti);
    Timer(Duration(seconds: 5), _navigateToNextScreen);
  }

  _showContent() {
    setState(() {
      _visible = true;
    });
  }

  _startConfetti() {
    _confettiController.play();
  }

  _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF142A70),
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 70,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset('assets/images/appbar-icon.png'),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Flashcard Quiz',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.purple,
              ],
              createParticlePath: _drawStar, // Custom particle shape
            ),
          ),
        ],
      ),
    );
  }


  Path _drawStar(Size size) {
    double width = size.width;
    double halfWidth = width / 2;
    double outerRadius = halfWidth;
    double innerRadius = halfWidth / 2.5;
    double angle = 2 * pi / 5;

    Path path = Path();
    for (int i = 0; i < 5; i++) {
      double x = halfWidth + outerRadius * cos(i * angle);
      double y = halfWidth + outerRadius * sin(i * angle);
      path.lineTo(x, y);
      x = halfWidth + innerRadius * cos((i + 0.5) * angle);
      y = halfWidth + innerRadius * sin((i + 0.5) * angle);
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

}
