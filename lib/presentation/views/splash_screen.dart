import 'package:flutter/material.dart';
import 'package:untitled3/presentation/views/first_screen.dart';
import 'package:untitled3/presentation/views/login_screen.dart';
import 'package:untitled3/presentation/views/on_boarding_screen.dart';

import '../../main.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 150,
              width: double.infinity,
              child: Image(
                image: AssetImage(
                  'assets/image/entertainment.png',
                ),
                // height: 50,
                // width: 50
              )),
          Text(
            'QAK_Movies',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 0.2,
                  color: Colors.blueGrey.shade400,
                  offset: Offset.fromDirection(100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
