import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/input_screen_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // โค้ด Delay หน้าจอ 3 วิ แล้วไปหน้า input
    Future.delayed(
      //ระยะเวลา
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputScreenUi(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img01.png',
              width: 230,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Car Installment",
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightGreenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Calculator",
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightGreenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Created by Satjatum",
              style: TextStyle(
                fontSize: 17,
                color: Colors.lightGreenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 15,
                color: Colors.lightGreenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
